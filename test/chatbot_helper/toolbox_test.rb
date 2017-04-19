require 'test_helper'
require 'fixtures/toolbox.rb'

class ChatbotHelper::ToolboxTest < Minitest::Test
  def setup
    @toolbox = ChatbotHelper::Telegram::Toolbox
    @fixtures = Fixtures::Toolbox
  end

  def test_parse_json
    # Valid json should parse correctly
    assert_equal @fixtures.valid_json_result,
                 @toolbox.parse_json(@fixtures.valid_json)

    # Primitive type should be parsed successfully
    assert_equal 1.0, @toolbox.parse_json('1.0')

    # Invalid json should return nil
    assert_nil @toolbox.parse_json(@fixtures.invalid_json)

    # Wrong type should return nil
    assert_nil @toolbox.parse_json(1.0)

    # parse_json(nil) should return nil
    assert_nil @toolbox.parse_json(nil)
  end

  def test_generate_json
    # Valid hash should generate correctly
    assert_equal @fixtures.valid_json,
                 @toolbox.generate_json(@fixtures.valid_json_result)

    # Primitive types should be generated successfully
    assert_equal '1.0', @toolbox.generate_json(1.0)

    # generate_json(nil) should generate null
    assert_equal 'null', @toolbox.generate_json(nil)

    # generate_json(NaN) should return nil
    assert_nil @toolbox.generate_json(Float::NAN)

    # generate_json(NaN) should not return nil if allow_nan is true
    refute_nil @toolbox.generate_json(Float::NAN, allow_nan: true)
  end
end
