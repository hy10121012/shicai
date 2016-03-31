require 'test_helper'

class Api::Seller::PriceControllerTest < ActionController::TestCase

  test "should get do_single_pricing" do

    post :do_single_pricing,{'item_id'=>1,'price'=>15}
    assert_response :success
  end

  test "should get do_batch_pricing" do
    get :do_batch_pricing ,{'sub_cat_id'=>1},{'user_id'=>10}
    assert_response :success
  end

  test "should get get_cat_item_price" do
    get :find_cat_item_prices ,{'sub_cat_id'=>1},{'user_id'=>'10'}
    assert_response :success
  end

end
