require 'test_helper'
require 'fixtures/resources.rb'

class ChatbotHelper::ResourcesTest < Minitest::Test
  def setup
    @toolbox = ChatbotHelper::Telegram::Toolbox
    @fixtures = Fixtures::Resources
  end

  def test_valid_message
    m = ChatbotHelper::Telegram::Message.new(string: @fixtures.valid_message)

    assert_equal 4, m.message_id
    assert_equal 1_492_106_508, m.date
  end

  def test_invalid_message
    assert_raises(ChatbotHelper::Exceptions::InvalidResource) do
      ChatbotHelper::Telegram::Message.new(string: @fixtures.invalid_message)
    end

    assert_raises(ChatbotHelper::Exceptions::InvalidResource) do
      ChatbotHelper::Telegram::Message.new(string:
                                           @fixtures.inner_invalid_message)
    end
  end

  def test_valid_update
    u = ChatbotHelper::Telegram::Update.new(string: @fixtures.valid_update)

    assert_equal 940_972_365, u.update_id

    # Test equality operator
    message = @toolbox.parse_json(@fixtures.valid_update)['message']
    m = ChatbotHelper::Telegram::Message.new(hash: message)

    assert_equal m, u.message

    assert m == u.message
    assert m.eql?(u.message)

    message[:message_id] = 5234
    m_wrong = ChatbotHelper::Telegram::Message.new(hash: message)

    refute_equal m_wrong, u.message

    refute m_wrong == u.message
    refute m_wrong.eql?(u.message)
  end

  def test_valid_user_profile_photos
    u = ChatbotHelper::Telegram::UserProfilePhotos.new(
      string: @fixtures.valid_user_profile_photos
    )

    json = @toolbox.parse_json(@fixtures.valid_user_profile_photos)

    assert ChatbotHelper::Telegram::PhotoSizeCollection
      .valid_resource?(json['photos'][0])

    # Test total_count
    assert_equal json['total_count'], u.total_count

    # Test photo_size elements
    valid_el = json['photos'][0][0]
    elements = []
    u.photos.flatten.each do |el|
      elements += el.elements
    end
    assert elements.include?(valid_el)
  end

  def test_valid_keyboard_button
    # We can either provide an object or just a string which must be
    # nevertheless a valid json string (i.e.: text = 'abc') is not enough, we
    # must wrap it in double quotes text = '"abc"'
    text = '"ButtonText"'
    k = ChatbotHelper::Telegram::KeyboardButton.new(string: text)

    assert_equal 'ButtonText', k.hash
  end
end
