module ChatbotHelper
  module Telegram
    # The user_profile_photos resource which represents a Telegram bot API
    # user_profile_photos
    class UserProfilePhotos < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[total_count]
        end

        def required_arrays
          [
            { name: 'photos',
              type: ChatbotHelper::Telegram::PhotoSizeCollection }
          ]
        end
      end
    end
  end
end
