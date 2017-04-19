module ChatbotHelper
  module Telegram
    # The audio resource which represents a Telegram bot API audio
    class Audio < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[file_id duration]
        end

        def optional_fields
          %w[performer title mime_type file_size]
        end
      end
    end
  end
end
