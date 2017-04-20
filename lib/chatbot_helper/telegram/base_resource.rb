module ChatbotHelper
  module Telegram
    # A base resource class for Telegram bot API resources.
    class BaseResource
      class << self
        # Returns an array of words which represent the required fields
        # for this resource
        #
        # Fields are primitive data types like +String+, +Integer+, +Boolean+
        # and +Float+ or arrays of primitive data types.
        # If you have more complex types like +Object+ or arrays of +Object+s,
        # see {required_objects}, {optional_objects}, {required_arrays} and
        # {optional_arrays}.
        #
        # @return [Array<String>] The required fields for this resource
        def required_fields
          %w[]
        end

        # Returns an array of words which represent the optional fields
        # for this resource
        #
        # Fields are primitive data types like +String+, +Integer+, +Boolean+
        # and +Float+ or arrays of primitive data types.
        # If you have more complex types like +Object+ or arrays of +Object+s,
        # see {required_objects}, {optional_objects}, {required_arrays} and
        # {optional_arrays}.
        #
        # @return [Array<String>] The optional fields for this resource
        def optional_fields
          %w[]
        end

        # Returns an array of hashes which represent the required objects
        # for this resource
        #
        # The hashes must follow the following structure:
        #
        # +{ name: 'field_name', type: 'ChatbotHelper::Telegram::FieldType' }+
        #
        # where +type+ represents the type of the resulting object which must
        # be a subclass of +ChatbotHelper::Telegram::BaseResource+
        #
        # @return [Array<Hash>] The required objects for this resource
        def required_objects
          []
        end

        # Returns an array of hashes which represent the optional objects
        # for this resource
        #
        # The hashes must follow the following structure:
        #
        # +{ name: 'field_name', type: 'ChatbotHelper::Telegram::FieldType' }+
        #
        # where +type+ represents the type of the resulting object which must
        # be a subclass of +ChatbotHelper::Telegram::BaseResource+
        #
        # @return [Array<Hash>] The optional objects for this resource
        def optional_objects
          []
        end

        # Returns an array of hashes which represent the required arrays
        # for this resource
        #
        # The hashes must follow the following structure:
        #
        # +{ name: 'field_name', type: 'ChatbotHelper::Telegram::FieldType' }+
        #
        # where +type+ represents the type of the resulting objects in the
        # array, which must be a subclass of
        # +ChatbotHelper::Telegram::BaseResource+
        #
        # Arrays are arrays of complex objects. If you have arrays of primitive
        # data types see {required_fields} and {optional_fields}.
        #
        # @return [Array<Hash>] The required arrays for this resource
        def required_arrays
          []
        end

        # Returns an array of hashes which represent the optional arrays
        # for this resource
        #
        # The hashes must follow the following structure:
        #
        # +{ name: 'field_name', type: 'ChatbotHelper::Telegram::FieldType' }+
        #
        # where +type+ represents the type of the resulting objects in the
        # array, which must be a subclass of
        # +ChatbotHelper::Telegram::BaseResource+
        #
        # Arrays are arrays of complex objects. If you have arrays of primitive
        # data types see {required_fields} and {optional_fields}.
        #
        # @return [Array<Hash>] The optional arrays for this resource
        def optional_arrays
          []
        end

        # Checks a given Hash and returns true iff it is a valid bot Resource as
        # defined in the Telegram bot documentation. Returns false otherwise.
        #
        # See https://core.telegram.org/bots/api for more information
        # about the resource structures.
        #
        # @param resource [Hash] The resource representing the Telegram bot API resource as a hash with stringified keys
        # @return [Boolean] True iff the given resource represents this resource as described in the Telegram bot API.
        # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
        # rubocop:disable Metrics/CyclomaticComplexity
        def valid_resource?(resource)
          return false if resource.nil? || !resource.respond_to?('[]')

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

        # Checks a given Hash and returns true iff it is a valid bot Resource as
        # defined in the Telegram bot documentation. Raises an exception
        # otherwise.
        #
        # See https://core.telegram.org/bots/api for more information
        # about the resource structures.
        #
        # @param resource [Hash] The resource representing the Telegram bot API resource as a hash with stringified keys
        # @return [Boolean] True iff the given resource represents this resource as described in the Telegram bot API.
        def valid_resource!(resource)
          if valid_resource?(resource)
            true
          else
            m = 'The given resource is not valid or does not follow its '\
                'specification from the Telegram bot API'
            raise ChatbotHelper::Exceptions::InvalidResource.new(m), m
          end
        end
      end

      attr_reader :hash

      # Initializes a new resource object with the given json String or hash.
      #
      # Either +hash+ or +string+ should be set but not both. It is recommended
      # to pass +string+ instead of an already deserialized hash (+hash+) to the
      # initializer.
      #
      # @param hash [Hash] A hash which represents this resource as described in the telegram bot api. Defaults to nil.
      # @param string [String] A json String which represents this resource as described in the telegram bot api. Defaults to nil.
      def initialize(hash: nil, string: nil)
        @toolbox = ChatbotHelper::Telegram::Toolbox
        @hash = hash.nil? ? @toolbox.parse_json(string) : @toolbox.parse_json(@toolbox.generate_json(hash))

        # Validate resource
        self.class.valid_resource!(@hash)

        # Implement getters
        implement_field_accessors
        implement_object_accessors
        implement_array_accessors
      end

      def to_s
        @toolbox.generate_json(@hash)
      end

      alias to_json to_s

      def ==(other)
        other.is_a?(ChatbotHelper::Telegram::BaseResource) ?
          @hash == other.hash :
          @hash == other
      end

      alias eql? ==

      protected

      def implement_field_accessors
        self.class.required_fields.each do |f|
          define_singleton_method(f) do
            return @hash[f]
          end
        end

        self.class.optional_fields.each do |f|
          define_singleton_method(f) do
            return @hash[f]
          end
        end
      end

      def implement_object_accessors
        self.class.required_objects.each do |o|
          res = o[:type].new(hash: @hash[o[:name]])
          define_singleton_method(o[:name]) do
            return res
          end
        end

        # Optional objects mus be either nil or a valid resource
        self.class.optional_objects.each do |o|
          res = nil
          res_val = @hash[o[:name]]
          res = o[:type].new(hash: res_val) unless res_val.nil?
          define_singleton_method(o[:name]) do
            return res
          end
        end
      end

      def implement_array_accessors
        self.class.required_arrays.each do |a|
          elements = []
          @hash[a[:name]].each do |el|
            elements << a[:type].new(hash: el)
          end
          define_singleton_method(a[:name]) do
            return elements
          end
        end

        # Optional arrays must be either nil or arrays of valid resources
        self.class.optional_arrays.each do |a|
          elements = []
          arr_val = @hash[a[:name]]
          unless arr_val.nil?
            arr_val.each do |el|
              elements << a[:type].new(hash: el)
            end
          end
          define_singleton_method(a[:name]) do
            return elements
          end
        end
      end
    end
  end
end
