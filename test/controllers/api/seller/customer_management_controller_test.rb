require 'test_helper'

class Api::Seller::CustomerManagementControllerTest < ActionController::TestCase
  test "should get find_customer" do
    get :find_customers, {'user_id'=>10}
    assert_response :success
    body = JSON.parse(response.body)
    assert body.size == 2
    assert body[0]['quantity']  ==300
    assert body[0]['amount']  ==6000
    assert body[1]['quantity']  ==100

  end

  test "should get find_customer_detail" do
    get :find_customer_detail
    assert_response :success
  end

end
