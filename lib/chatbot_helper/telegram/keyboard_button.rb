module ChatbotHelper
  module Telegram
    # The keyboard_button resource which represents a Telegram bot API
    # keyboard_button
    class KeyboardButton < ChatbotHelper::Telegram::BaseResource
      class << self
        def required_fields
          %w[text]
        end

        def optional_fields
          %w[request_contact request_location]
        end

        def valid_resource?(resource)
          return false if resource.nil?

          # A KeyboardButton can be a simple String.
          # So if it is string like, return true because it
          # is valid.
          return true if resource.respond_to?(:to_str)

          # TODO: This is duplicate code. Maybe this can be avoided...

          # Test resource as always
          required_fields.each do |f|
            return false if resource[f].nil?
          end

          required_objects.each do |o|
            return false unless o[:type].valid_resource?(resource[o[:name]])
          end

          required_arrays.each do |a|
            arr = resource[a[:name]]
            return false unless arr.respond_to?('each')
            arr.each do |el|
              return false unless a[:type].valid_resource?(el)
            end
          end

          # All tests passed. Return true...
          true
        end
      end

      def implement_field_accessors
        if @hash.respond_to?(:to_str)
          define_singleton_method('text') do
            # TODO: Should we return @hash.to_str so it is always a `String`?
            return @hash
          end
        else
          super
        end
      end
    end

    # A keyboard_button collection which represents an array of keyboard_button
    # resources
    class KeyboardButtonCollection < ChatbotHelper::Telegram::CollectionResource
      class << self
        def collection_type
          ChatbotHelper::Telegram::KeyboardButton
        end
      end
    end
  end
end
