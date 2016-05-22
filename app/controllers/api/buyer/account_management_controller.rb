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

  def find_user_default_address
    #获取卖家地址
    user_id = session[:user_id]
    address = Address.find_by(user_id: user_id, is_default: true)
    render json: address
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
    id=params[:id]
    addr1 = params[:aaddress_1]
    addr2 = params[:aaddress_2]
    postcode = params[:postcode]
    district = District.find params[:district_id]
    city = City.find params[:city_id]
    phone = params[:phone]

    address = Address.find id
    address.user_id = session[:user_id]
    address.address1=addr1
    address.address2 = addr2
    address.postcode=postcode
    address.district=district
    address.city=city.name
    address.telephone=phone
    if address.save
      render text: true
    else
      render text: false
    end


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


  def get_address_params
    params[:address].permit(:address)
  end


end
