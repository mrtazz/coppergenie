require 'sinatra/base'
require 'json'
require 'net/http'

class CopperGenie

  class Server < Sinatra::Base

    post "/?" do
      JSON.parse(request.body)
    end

    def event_id
      @event['client']['name'] + '/' + @event['check']['name']
    end

    def close_alert
      post_to_opsgenie(:close, {:alias => event_id})
    end

    def create_alert(description)
      post_to_opsgenie(:create, {:alias => event_id, :message => description})
    end

    def post_to_opsgenie(action = :create, params = {})
      params["customerKey"] = settings["opsgenie"]["customerKey"]
      params["recipients"]  = settings["opsgenie"]["recipients"]

      uripath = (action == :create) ? "" : "close"

      uri = URI.parse("https://api.opsgenie.com/v1/json/alert/#{uripath}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(uri.request_uri,initheader = {'Content-Type' =>'application/json'})
      request.body = params.to_json
      response = http.request(request)
      JSON.parse(response.body)
    end
  end

end
