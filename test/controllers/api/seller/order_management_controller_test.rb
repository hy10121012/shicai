require 'test_helper'

class Api::Seller::OrderManagementControllerTest < ActionController::TestCase
  test "should get find_all_orders" do
    get :find_all_orders,{'user_id'=>10}
    assert_response :success
    body = JSON.parse(response.body)
    assert body['NEW'].size ==2
    assert body['ACCEPTED'].size ==1

  end

  test "should get find_orders_by_type" do
    get :find_orders_by_type ,{'user_id'=>10,'status'=>OrderStatus::NEW}
    assert_response :success
    body = JSON.parse(response.body)
    assert body.size==2
  end

  test "should get order_detail" do
    get :order_detail , {'order_id'=>1}
    assert_response :success
    body = JSON.parse(response.body)
    assert body['user_id']==10

  end

  test "should get trigger_favor" do
    get :trigger_favor
    assert_response :success
  end

  test "should get find_order_items" do
    get :find_order_items, {'order_id'=>1}
    assert_response :success
    body = JSON.parse(response.body)
    assert body.size==2
  end

end
