require 'test_helper'

class Seller::FinanceManagementControllerTest < ActionController::TestCase
  test "should get finance_summary" do
    get :finance_summary
    assert_response :success
  end

end
