require 'test_helper'

class Seller::PriceControllerTest < ActionController::TestCase
  test "should get update_price" do
    get :update_price
    assert_response :success
  end

end
