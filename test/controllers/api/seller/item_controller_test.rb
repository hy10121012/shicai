require 'test_helper'

class Api::Seller::ItemControllerTest < ActionController::TestCase


  test "should get find_single_item" do
    item = items(:beef_1)
    get :find_single_item, {'item_id' => item.id}
    assert_response :success
    body = JSON.parse(response.body)
    assert body['name'] == 'beef_1'
    assert body['price'] == 3.5
  end

  test "this should update item with specific field" do
    item = items(:beef_1)
    post :update_single_field, {'item_id'=> item.id,'field'=>'price','value'=>10}
    assert_response :success
    itm = Item.find(item.id)
    assert itm.price==10

  end

  test "this should update item with specific field change name" do
    item = items(:beef_1)
    post :update_single_field, {'item_id'=> item.id,'field'=>'name','value'=>'changed beef name'}
    assert_response :success
    itm = Item.find(item.id)
    assert itm.name=='changed beef name'

  end

end
