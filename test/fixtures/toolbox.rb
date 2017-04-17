module Fixtures
  @valid_json = '{"foo": "bar"}'
  @valid_json_hash = { 'foo' => 'bar' }
  attr_reader :valid_json, :valid_json_hash
end
