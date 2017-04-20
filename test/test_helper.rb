# Start simplecov for code climate test coverage
require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'chatbot_helper/telegram'

require 'minitest/autorun'
