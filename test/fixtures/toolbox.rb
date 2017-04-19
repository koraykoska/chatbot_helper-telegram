module Fixtures
  module Toolbox
    # The valid json and its result
    @valid_json = '{"foo":"bar"}'
    @valid_json_result = { 'foo' => 'bar' }

    # An invalid json string and the expected result
    @invalid_json = '{foo-bar--barbar}}'

    class << self
      attr_reader :valid_json, :valid_json_result
      attr_reader :invalid_json
    end
  end
end
