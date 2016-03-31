require 'test_helper'

class Api::Buyer::AccountManagementControllerTest < ActionController::TestCase
  test "should get find_orders_by_status" do
    get :find_orders_by_status, {'status'=>'NEW'},{'user_id'=>1}
    assert_response :success
    body = JSON.parse(response.body)
    assert body.size ==2
  end

  test "should get find_order_count_summary" do
    get :find_order_count_summary, {'status'=>'NEW'},{'user_id'=>1}
    assert_response :success
    assert response.body=='2'
  end

  test "should get find_user_addresses" do
    get :find_user_addresses ,nil,{'user_id'=>1}
    assert_response :success
    body = JSON.parse(response.body)
    assert body.size ==2

  end

end
