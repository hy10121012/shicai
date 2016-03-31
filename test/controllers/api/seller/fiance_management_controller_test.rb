require 'test_helper'

class Api::Seller::FianceManagementControllerTest < ActionController::TestCase
  test "should get find_finance_summary" do
    get :find_finance_summary ,nil,{"user_id"=>10}
    assert_response :success
  end

end
