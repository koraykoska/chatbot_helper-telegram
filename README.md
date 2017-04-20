# ChatbotHelper::Telegram [![Gem Version](https://badge.fury.io/rb/chatbot_helper-telegram.svg)](https://badge.fury.io/rb/chatbot_helper-telegram) [![Build Status](https://travis-ci.org/Ybrin/chatbot_helper-telegram.svg?branch=master)](https://travis-ci.org/Ybrin/chatbot_helper-telegram) [![Code Climate](https://codeclimate.com/github/Ybrin/chatbot_helper-telegram/badges/gpa.svg)](https://codeclimate.com/github/Ybrin/chatbot_helper-telegram) [![Test Coverage](https://codeclimate.com/github/Ybrin/chatbot_helper-telegram/badges/coverage.svg)](https://codeclimate.com/github/Ybrin/chatbot_helper-telegram/coverage)

`ChatbotHelper::Telegram` helps you build awesome Telegram chatbots without bothering much about the documentation, the message structure or other details. It is a wrapper around the [Telegram Bot API](https://core.telegram.org/bots/api).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chatbot_helper-telegram'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chatbot_helper-telegram

Then require it and you are good to go:

```ruby
require 'chatbot_helper/telegram'
```

## Usage

As of now, you are responsible for getting messages or other objects from the Telegram Bot API with your favorite HTTP library. We consider adding all Bot API methods to this library in one of the next versions. Please open an [issue](https://github.com/Ybrin/chatbot_helper-telegram/issues) if you think that's a good idea.

An example with [typhoeus](https://github.com/typhoeus/typhoeus):

```ruby
require 'typhoeus'
require 'chatbot_helper/telegram'
require 'json'

# Your environment must have set the `TELEGRAM_TOKEN` key to your telegram api
# token. See https://core.telegram.org/bots#3-how-do-i-create-a-bot for more
# information.
telegram_token = ENV['TELEGRAM_TOKEN']
url = "https://api.telegram.org/bot#{telegram_token}/sendMessage"

# We create a message
message = {
  chat_id: 123456,
  text: "This is an example message sent by my telegram bot"
}

request = Typhoeus::Request.new(
  url,
  method: :post,
  body: JSON.generate(message),
  headers: { 'Content-Type' => 'application/json' }
)
request.run

body = request.response.body

# We create a Message object from the response body
message = ChatbotHelper::Telegram::Message.new(string: body)

# Now you can access all properties of the message object
puts message.date
puts message.from.first_name

# Yay!
```

The real power of this library is the update and command parsing.    
Say, for example, you have set up [webhooks](https://core.telegram.org/bots/api#setwebhook) and you want to parse the updates retrieved from these webhook requests. This is a [sinatra](http://www.sinatrarb.com/) example but you can easily convert it to Rails code.    

```ruby
require 'sinatra'
require 'chatbot_helper/telegram'
require 'json'

post "/#{ENV['TELEGRAM_TOKEN']}/?" do
  request.body.rewind
  payload_body = request.body.read

  # Create an instance of Update from the request body...
  update = ChatbotHelper::Telegram::Update.new(string: payload_body)

  # Return a message based on the given command
  message = {}
  if update.message
    # Access the chat id through the given message
    message[:chat_id] = update.message.chat.id

    case update.message.text
    when '/start'
      text = "Hello and welcome to my awesome bot #{update.chat.first_name}!"
      message[:text] = text
    when '/saysomething'
      text = "Why should I talk with you, #{update.chat.first_name}? Give me "\
             "a reason!"
      message[:text] = text
    end

    # Return the message which should be sent
    return halt 200, { 'Content-Type' => 'application/json' }, JSON.generate(message)
  end

  # Fallback, return nothing
  return halt 200, { 'Content-Type' => 'application/json' }, '{}'
end
```

You can work with nearly all Telegram Bot API [available types](https://core.telegram.org/bots/api#available-types).    
One exception are the `Inline mode` types which has currently just partial support and will be fully available in the next version.

If you need help or have a feature request feel free and open an [issue](https://github.com/Ybrin/chatbot_helper-telegram/issues).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Ybrin/chatbot_helper-telegram.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
