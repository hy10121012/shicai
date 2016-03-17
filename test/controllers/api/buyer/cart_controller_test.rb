require 'test_helper'

class Api::Buyer::CartControllerTest < ActionController::TestCase
  test "should get find_current_cart_list" do
    get :find_current_cart_list
    assert_response :success
  end

end
