require 'sinatra/base'
require 'json'
require 'net/https'

class CopperGenie

  class Server < Sinatra::Base

    post "/?" do
      begin
        alert = JSON.parse(request.body.read)
      rescue
        puts "parse error"
      end
      if alert["kind"] == "active"
        create_alert(alert)
      else
        close_alert(alert)
      end
    end

    def close_alert(alert)
      label = alert["details"][2]["label"]
      post_to_opsgenie(:close, {:alias => label})
    end

    def create_alert(alert)
      description = alert["alert_text"]
      label = alert["details"][2]["label"]
      post_to_opsgenie(:create, {:alias => label, :message => description})
    end

    def post_to_opsgenie(action = :create, params = {})
      params["customerKey"] = ENV["OPSGENIE_CUSTOMERKEY"]
      params["recipients"]  = ENV["OPSGENIE_RECIPIENTS"]

      uripath = (action == :create) ? "" : "close"

      uri = URI.parse("https://api.opsgenie.com/v1/json/alert/#{uripath}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(uri.request_uri,initheader = {'Content-Type' =>'application/json'})
      request.body = params.to_json
      http.request(request)
    end
  end

end
