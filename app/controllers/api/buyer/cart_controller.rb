class Api::Buyer::CartController < ApplicationController
  def find_current_cart_list
    #获取当前购物车
    cart_items = Cart.eager_load(:item).where :user_id => session[:user_id]


    return_map = {}
    return_map[:user] = User.find(session[:user_id])

    item_arr = []
    cart_items.each do |item|
      attr = item.attributes
      attr[:item] = item.item
      attr[:unit] = Unit.find_unit_by_item_id item.item.unit_id
      attr[:pic] = Item.get_item_pic item.item
      item_arr.push(attr)
    end
    return_map[:items] = item_arr
    render json: return_map
  end

  def update_quantity
    #修改购物车价格
    cart_id = params[:id]
    item = Cart.find_by :id => session[:user_id], :id => cart_id
    qty = params[:quantity]
    item.quantity = qty
    if item.save
      render text: true
    else
      render text: false
    end
  end

  def delete_item
    #从购物车内删除货品
    cart_id = params[:id]
    if Cart.find_by(:user_id => session[:user_id], :id => cart_id).destroy
      render text: true
    else
      render text: false
    end
  end

  def create_order
    #下单
    items = params[:items]
    address_id = params[:address_id]
    address_detail = Address.find_address address_id
    delivery_time = params[:date].gsub(/\D/, '')+params[:time].to_s
    amt = 0
    items.each do |item|
      amt += item['quantity'] * item['item']['price']
    end
    id = nil
    Item.transaction do
      addr_text = address_detail['name']+"|"+address_detail['address1']+"|"+address_detail[:street]+"|"+address_detail[:district]+"|"+address_detail[:city]

      order = Order.new :delivery_address => addr_text, :delivery_date_time => delivery_time, :user_id => session[:user_id],  :status => OrderStatus::PAYABLE,  :amount => amt,  :version => 0,  :is_latest_version => true,  :entity_id => Order.find_next_entity_id
      order.save
      id = order.id

      create_order_items order.entity_id, items
      Cart.delete_all :user_id => session[:user_id]
    end
    render text: id
  end

  private
  def create_order_items order_id, items
    items.each do |item|
      order_item = OrderItem.new :order_entity_id => order_id, :item_id => item["item"]["id"], :price => item["item"]["price"], :quantity => item["quantity"]
      order_item.save
    end
  end


end
