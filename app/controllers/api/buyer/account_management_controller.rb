class Api::Buyer::AccountManagementController < ApplicationController
  def find_orders_by_status
    #获取各种状态下的订单 完成的 进行中的 待付款的
    status=params[:status]
    user_id = session[:user_id]
    orders = Order.where buyer_user_id: user_id, status: status
    render json: orders
  end

  def find_order_count_summary
    #获取各个状态订单总数
    status=params[:status]
    user_id = session[:user_id]
    count = Order.find_order_count_by_status user_id, status
    render text: count


  end

  def find_user_addresses
    #获取卖家地址
    user_id = session[:user_id]
    addresses = Address.where user_id: user_id
    render json: addresses
  end

  def do_buyer_verification
    #验证卖家信息


  end


  def update_address

  end

  def remove_address

  end

  def create_address

  end

  def update_pw

  end



end
