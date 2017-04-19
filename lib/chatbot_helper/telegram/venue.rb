module ChatbotHelper
  module Telegram
    # The venue resource which represents a Telegram bot API venue
    class Venue < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[title address]
        end

        def optional_fields
          %w[foursquare_id]
        end

        def required_objects
          [
            { name: 'location', type: ChatbotHelper::Telegram::Location }
          ]
        end
      end
    end
  end
end
