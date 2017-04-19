module ChatbotHelper
  module Telegram
    # The location resource which represents a Telegram bot API location
    class Location < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[longitude latitude]
        end
      end
    end
  end
end
