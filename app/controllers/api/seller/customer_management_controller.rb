class Api::Seller::CustomerManagementController < ApplicationController
  def find_customer
    user_id = params[:user_id]
    summaries = Order.find_customer_summary_by_user_id user_id
    render json: summaries
  end

  def find_customer_detail
    customer_user_id = params[:customer_id]
    user = User.find_by id: customer_user_id

    render json: user
  end

  def find_customer_history
    customer_user_id = params[:customer_id]
    user_id = session[:user_id]
    orders = Order.where user_id: user_id, buyer_user_id: customer_user_id

    render json: orders
  end

end
