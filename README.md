txtvote
=======
SMS Shortcodes and plain old phone numbers can be used for interacting with your users beyond blasting them messages. This application is a complete example on a working system for this in Rails. It utilizes the Twilio API to handle and record incoming votes while including required flows for shortcodes, utilizing a standard US phone number to handle folks that can't use shortcodes (e.g. some MetroPCS, Verizon, and foreign cell provider customers). This demo will be featured and discussed at length at [Twiliocon 2012](http://www.twilio.com/conference). See you in San Francisco!

Usage
-----
To begin using this, register an account with [Twilio](https://www.twilio.com) and buy a shortcode and/or phone number. This application uses the [Rails Config](https://github.com/railsjedi/rails_config) gem. Place account details in settings.yml (in the root of this application's config directory). Example:

> config/settings.yml

      twilio_sid: 'your sid'
      twilio_token: 'your token'
      twilio_shortcode: 'your shortcode (number)' 
      twilio_phone: 'your non-shortcode phone number'
      contest_start: '2012-10-16 00:00:00'
      contest_end: '2012-10-19 00:00:00'

From there, tweak anything else you want and deploy to the web host of your choice, like Heroku or whatevs the kids are using these days. This is a Rails 3.2 application. If you're new to Rails, check out these fine dox:

  * The Getting Started Guide: http://guides.rubyonrails.org/getting_started.html
  * Ruby on Rails Tutorial Book: http://www.railstutorial.org/

License
-------
This application is distributed under the MIT license. Please see the included copy of the license for deets.