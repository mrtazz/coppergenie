# coppergenie [![Code Climate](https://codeclimate.com/github/mrtazz/coppergenie.png)](https://codeclimate.com/github/mrtazz/coppergenie)

## Overview
This is a simple sinatra app which acts as a bridge between
[copperegg](http://copperegg.com) alerts and
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

## License

Copyright (C) 2013 Daniel Schauenberg

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
