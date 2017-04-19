module ChatbotHelper
  module Telegram
    # The chat resource which represents a Telegram bot API chat
    class Chat < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[id type]
        end

        def optional_fields
          %w[title username first_name last_name all_members_are_administrators]
        end
      end
    end
  end
end
