require 'test_helper'

class Seller::OrderManagementControllerTest < ActionController::TestCase
  test "should get orders" do
    get :orders
    assert_response :success
  end

  test "should get orderDetail" do
    get :orderDetails
    assert_response :success
  end

  test "this should return tmr order" do
    get :find_tmr_orders
    assert_response :success

  end



end
