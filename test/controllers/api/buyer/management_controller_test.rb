require 'test_helper'

class Api::Buyer::ManagementControllerTest < ActionController::TestCase
  test "should get find_favor_sellers" do
    get :find_favor_sellers
    assert_response :success
  end

  test "should get find_favor_items" do
    get :find_favor_items
    assert_response :success
  end

  test "should get find_frequent_item" do
    get :find_frequent_item
    assert_response :success
  end

  test "should get remove_favor_seller" do
    get :remove_favor_seller
    assert_response :success
  end

  test "should get remove_favor_item" do
    get :remove_favor_item
    assert_response :success
  end

end
