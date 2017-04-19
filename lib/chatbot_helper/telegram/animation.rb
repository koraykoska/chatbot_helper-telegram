module ChatbotHelper
  module Telegram
    # The animation resource which represents a Telegram bot API animation
    class Animation < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[file_id]
        end

        def optional_fields
          %w[file_name mime_type mime_type]
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
