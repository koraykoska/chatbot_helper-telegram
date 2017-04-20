module ChatbotHelper
  module Telegram
    # The response_parameters resource which represents a Telegram bot API
    # response_parameters
    class ResponseParameters < ChatbotHelper::Telegram::BaseResource
      class << self
        def optional_fields
          %w[migrate_to_chat_id retry_after]
        end
      end
    end
  end
end
