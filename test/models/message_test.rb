require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @chatroom = chatrooms(:one)
    @message = Message.new(content: 'FooBar', user_id: @user.id, chatroom_id: @chatroom.id)
  end
  test "should be valid" do
    assert @message.valid?
  end
  test "content should be present" do
    @message.content = "     "
    assert_not @message.valid?
  end
  test "user_id should be present" do
    @message.user_id = "     "
    assert_not @message.valid?
  end
end
