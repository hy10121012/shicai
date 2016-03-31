require 'test_helper'

class OrderControllerTest < ActionController::TestCase
  test "should get orders" do
    get :orders
    assert_response :success
  end

  test "should get orderDetail" do
    get :orderDetails
    assert_response :success
  end

end
