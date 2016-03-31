class Seller::CustomerManagementController < ApplicationController
  def customers
  end

  def customer_details
    @id = params[:user_id]


  end
end
