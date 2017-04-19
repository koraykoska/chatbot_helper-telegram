module ChatbotHelper
  module Exceptions
    # A default Error class which should not be used but instead subclassed
    class Error < RuntimeError
      attr_reader :errors

      def initialize(*errors)
        @errors = errors
      end

      class << self
        def description
          raise NotImplementedError, 'Description of subclass not implemented'
        end
      end
    end

    # An invalid resource error
    class InvalidResource < Error
      class << self
        def description
          'A resource is invalid or does not follow its specification'
        end
      end
    end
  end
end
