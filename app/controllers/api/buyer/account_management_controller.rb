class Api::Buyer::AccountManagementController < ApplicationController

  def find_orders_by_status
    #获取各种状态下的订单 完成的 进行中的 待付款的
    status=params[:status]
    user_id = session[:user_id]
    orders = Order.where user_id: user_id, status: status
    render json: orders
  end

  def find_order_count_summary
    #获取各个状态订单总数
    status=params[:status]
    user_id = session[:user_id]
    count = Order.find_order_count_by_status user_id, status
    render text: count
  end

  def do_buyer_verification
    #验证卖家信息


  end



  def remove_address
    id=params[:id]
    address = Address.find id
    if address.user_id == session[:user_id]
      address.delete
      render text: true
    else
      render text: false
    end
  end

  def create_address
    address = get_address_params
    address[:user_id] = session[:user_id]
    addr = Address.create address
    if !addr.nil?
      render text: true
    else
      render text: false
    end
  end

  def update_pw

  end



end
