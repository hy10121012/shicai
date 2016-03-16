require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new
    @ori_pw =  "test123"
    @user.pw = Digest::MD5.hexdigest(@ori_pw)
    @user.email="ser@email.com"
    @user.phone= "123456"
    @user.user_type=1
    @user.address1="add test3"
    @user.save
  end

  def teardown
    @user = nil
  end

  test "authentication with email" do
    token = User.get_user_login_token(@user.email,@ori_pw)
    assert token != false &&   !token.nil?
  end

  test "authentication with phone" do
    token = User.get_user_login_token(@user.phone,@ori_pw)
    assert token != false &&   !token.nil?
  end

  test "failed login" do
    token = User.get_user_login_token(@user.phone,"123wrong")
    assert token == false
  end

  test "found no user" do
    token = User.get_user_login_token("wrong_user",@ori_pw)
    assert token.nil?
  end

end
