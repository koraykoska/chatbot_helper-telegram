module ChatbotHelper
  module Telegram
    # The document resource which represents a Telegram bot API document
    class Document < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[file_id]
        end

        def optional_fields
          %w[file_name mime_type file_size]
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
