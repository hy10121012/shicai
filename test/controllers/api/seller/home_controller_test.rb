require 'test_helper'

class Api::Seller::HomeControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end


  test "find all item by user and cat by cat" do
    user = users(:seller_user)
    get :find_selling_items, {'user_id' => user.id}
    assert_response :success
    body = JSON.parse(response.body)
    assert body['meat'].size ==3
    assert body['fruit'].size ==1


  end


end
