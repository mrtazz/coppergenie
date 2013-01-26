# coppergenie

## Overview
This is a simple sinatra app which acts as a bridge between
[copperegg](copperegg.com) alerts and
[opsgenie](http://www.opsgenie.com/) notifications.

## Setup
Initialize the heroku app
```
heroku create --stack cedar
heroku config:add OPSGENIE_CUSTOMERKEY="YOURKEY"
heroku config:add OPSGENIE_RECIPIENTS="the,recipients"
git push heroku master
```

Now configure your heroku instance as the webhook endpoint of your copperegg
notification profile.

## Meta

