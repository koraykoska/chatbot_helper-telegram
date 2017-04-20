# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chatbot_helper/telegram/version'

Gem::Specification.new do |spec|
  spec.name          = 'chatbot_helper-telegram'
  spec.version       = ChatbotHelper::Telegram::VERSION
  spec.authors       = ['Koray Koska']
  spec.email         = ['koray@koska.at']

  spec.summary       = %q{Easily handle Telegram chatbot messages in Ruby}
  spec.description   = %q{This library tries to help working with messages from the Telegram chatbot API. Messages are parsed and useful methods provide all needed information about the message.}
  spec.homepage      = 'https://github.com/Ybrin/chatbot_helper-telegram'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Development dependencies
  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 1.0.0'

  # Project dependencies
  spec.add_dependency 'json', '~> 2.0'
end
