module ChatbotHelper
  module Telegram
    # The sticker resource which represents a Telegram bot API sticker
    class Sticker < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[file_id width height]
        end

        def optional_fields
          %w[emoji file_size]
        end

        def optional_objects
          [
            { name: 'thumb', type: ChatbotHelper::Telegram::PhotoSize }
          ]
        end
      end
    end
  end
end
