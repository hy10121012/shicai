require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "authentication with phone" do
    user = users(:buyer_user2)
    token = User.get_user_login(user.phone,'12345')
    assert token.token == user.token
  end

  test "authentication with email" do
    user = users(:buyer_user2)
    token = User.get_user_login(user.email,'12345')
    assert token.token == user.token
  end

  test "failed login" do
    user = users(:buyer_user2)

    token = User.get_user_login(user.phone,"123wrong")
    assert token == false
  end

  test "found no user" do
    user = users(:buyer_user2)

    token = User.get_user_login("wrong_user",user.pw)
    assert token.nil?
  end



end
