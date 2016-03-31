require 'test_helper'

class Api::Buyer::HomeControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "test home page get 7 cat" do
    get :find_home_category_items
    body = JSON.parse(response.body)
    assert body.size ==5
    assert body[0]['name'] == 'meat'
  end






end
