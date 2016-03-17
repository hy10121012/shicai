require 'test_helper'

class Api::Buyer::AccountManagementControllerTest < ActionController::TestCase
  test "should get find_orders_by_status" do
    get :find_orders_by_status
    assert_response :success
  end

  test "should get find_order_count_summary" do
    get :find_order_count_summary
    assert_response :success
  end

  test "should get find_user_addresses" do
    get :find_user_addresses
    assert_response :success
  end

end
