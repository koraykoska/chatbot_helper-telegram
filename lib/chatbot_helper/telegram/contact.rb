module ChatbotHelper
  module Telegram
    # The contact resource which represents a Telegram bot API contact
    class Contact < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[phone_number first_name]
        end

        def optional_fields
          %w[last_name user_id]
        end
      end
    end
  end
end
