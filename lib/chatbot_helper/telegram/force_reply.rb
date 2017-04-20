module ChatbotHelper
  module Telegram
    # The force_reply resource which represents a Telegram bot API force_reply
    class ForceReply < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[force_reply]
        end

        def optional_fields
          %w[selective]
        end
      end
    end
  end
end
