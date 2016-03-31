require 'test_helper'

class Seller::CustomerManagementControllerTest < ActionController::TestCase
  test "should get customers" do
    get :customers
    assert_response :success
  end

  test "should get customer_details" do
    get :customer_details
    assert_response :success
  end

end
