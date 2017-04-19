module ChatbotHelper
  module Telegram
    # The voice resource which represents a Telegram bot API voice
    class Voice < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[file_id duration]
        end

        def optional_fields
          %w[mime_type file_size]
        end
      end
    end
  end
end
