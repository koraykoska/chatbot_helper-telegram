module ChatbotHelper
  module Telegram
    # The video resource which represents a Telegram bot API video
    class Video < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[file_id width height duration]
        end

        def optional_fields
          %w[mime_type file_size]
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
