class Api::Seller::OrderManagementController < ApplicationController
  def find_all_orders
    user_id = params[:user_id]
    orders = Order.where user_id: user_id
    return_map = {OrderStatus::NEW => [], OrderStatus::ACCEPTED => [], OrderStatus::PAYABLE => [], OrderStatus::COMPLETED => []}

    unless orders.nil?
      orders.each do |order|
        return_map[order.status].push order
      end
    end
    render json: return_map
  end

  def find_orders_by_type
    user_id = params[:user_id]
    stauts = params[:status]
    orders = Order.where user_id: user_id, status: stauts

    render json: orders
  end

  def order_detail
    render json: Order.find(params[:order_id])
  end

  def trigger_favor
    user_id = params[:user_id]
    self_id = session[:user_id]

    if FavorUser.exists? user_id: self_id, favor_id: user_id
      FavorUser.delete user_id: self_id, favor_id: user_id
      result='D'
    else
       FavorUser.create user_id: self_id, favor_id: user_id
       result='A'
    end
    render text: result
  end

  def find_order_items
    order_id = params[:order_id]
    items = OrderItem.where order_id: order_id
    render json: items
  end
end
