class Seller::OrderManagementController < ApplicationController
  def orders
  end

  def order_details
    @id=params[:order_id]
  end
end
