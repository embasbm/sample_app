require 'test_helper'

class ChatroomsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "should get index" do
    log_in_as(@user)
    get chatrooms_url
    assert_response :success
  end

  test "should get show" do
    log_in_as(@user)
    chatroom = chatrooms(:one)
    get chatroom_url(chatroom)
    assert_response :success
  end

end
