require 'test_helper'

class Api::LoginControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "just to test the test " do
    assert true
  end


  test "login user with correct info" do

  end

  test "should create user" do
    put :do_create_user, {'email'=>'test_email@hotmail.com','phone'=>'07801749626','user_type'=>'1','pw'=>'test1234'}
    assert_response :success
    assert response.body == 'true'
    user = User.find_by email: 'test_email@hotmail.com'
    assert !user.nil?
    assert user.email== 'test_email@hotmail.com'

  end


end
