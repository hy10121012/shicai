class Api::Seller::ItemController < ApplicationController
  def find_single_item
    item_id = params[:item_id]
    render json: Item.find(item_id)
  end

  def update_single_field
    field = params[:field]
    value = params[:value]
    item_id = params[:item_id]

    item = Item.find(item_id)
    eval("item."+field+"=value")
    render json: item.save
  end

  def upload_picture

  end


end
