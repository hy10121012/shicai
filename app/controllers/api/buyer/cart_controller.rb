class Api::Buyer::CartController < ApplicationController
  def find_current_cart_list
    #获取当前购物车
    cart_items = Cart.find_by :user_id => session[:user_id]
    render json: cart_items
  end

  def update_quantity
    #修改购物车价格
    item_id = params[:item_id]
    item = Cart.find_by :user_id => session[:user_id], :item_id => item_id
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
    item_id = params[:item_id]
    if Cart.delete :user_id => session[:user_id], :item_id => item_id
      render text: true
    else
      render text: false
    end
  end

  def create_order
    #下单
    items = params[:items]
    address_id = params[:address_id]
    comment = params[:comment]
    buyer_id = session[:user_id]
    address_detail = Address.find address_id
    delivery_time = params[:delivery_time]
    orders = {}
    state = {"qty"=>{},"amount"=>{}}
    items.each do |item|
      if orders[item['user_id']].nil?
        orders[item['user_id']] = []
        state["qty"][item['user_id']] = 0
        state["amount"][item['user_id']] = 0
      end
      orders[item['user_id']].push(item)
      qty =   item["quantity"].to_i
      state["qty"][item['user_id']] += qty
      price = item["price"].to_f
      state["amount"][item['user_id']] += qty * price
    end
    Item.transaction do
      orders.each do |seller_id, items|
        addr_text = address_detail.address1+"\n"+address_detail.address2+"\n"+address_detail.district+"\n"+address_detail.city
        order = Order.new :buyer_user_id => buyer_id, :delivery_address => addr_text, :delivery_date_time => delivery_time, :user_id => seller_id, :comment => comment, :status => OrderStatus::NEW ,:quantity=> state["qty"][seller_id] , :amount=> state["amount"][seller_id]
        order.save
        create_order_items order.id, items
      end
    end
    render :text => true
  end

  private
  def create_order_items order_id, items
    items.each do |item|
      order_item = OrderItem.new :order_id=>order_id, :item_id=>item["item_id"] , :price=> item["price"], :quantity=> item["quantity"]
      order_item.save
    end
  end





end
