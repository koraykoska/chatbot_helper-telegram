module ChatbotHelper
  module Telegram
    # The photo_size resource which represents a Telegram bot API photo_size
    class PhotoSize < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[file_id width height]
        end

        def optional_fields
          %w[file_size]
        end
      end
    end

    # A photo_size collection which represents an array of photo_size resources
    class PhotoSizeCollection < ChatbotHelper::Telegram::CollectionResource
      class << self
        def collection_type
          ChatbotHelper::Telegram::PhotoSize
        end
      end
    end
  end
end
