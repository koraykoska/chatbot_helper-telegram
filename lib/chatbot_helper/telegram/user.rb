module ChatbotHelper
  module Telegram
    # The user resource which represents a Telegram bot API user
    class User < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[id first_name]
        end

        def optional_fields
          %w[last_name username]
        end
      end
    end
  end
end
