require 'test_helper'

class Api::Buyer::CartControllerTest < ActionController::TestCase
  test "should get find_current_cart_list" do
    get :find_current_cart_list
    assert_response :success
  end

  test "create a order with items" do
    params = {"address_id"=>addresses(:one).id,"comment"=>"coment 1234","delivery_time"=>20160301}

    item1 = {"item_id"=>1,"user_id"=>10,"quantity"=>100,"price"=>12.5}
    item2 = {"item_id"=>2,"user_id"=>10,"quantity"=>50,"price"=>12.5}
    item3= {"item_id"=>2,"user_id"=>11,"quantity"=>50,"price"=>12.5}
    items = [item1,item2,item3]
    params["items"] = items

    put :create_order ,params,{"user_id"=>1}

    order = Order.find_by :comment=>'coment 1234'
    assert order.delivery_date_time== 20160301

    orderItems = OrderItem.where :item_id=>2
    assert orderItems.size==2

  end




end
