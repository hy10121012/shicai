class Api::Seller::InventoryController < ApplicationController

  def find_selling_items
    user_id = session[:user_id]
    items =Item.where("user_id = ?", user_id)
    return_map = {}

    items.each do |item|
      cat_name = item.sub_cat.category.name
      if return_map[cat_name].nil?
        return_map[cat_name]=[]
      end
      return_map[cat_name].push(item)

    end

    return_map
    render json: return_map

  end

  def find_selling_cats
    user_id = session[:user_id]
    cats = Category.find_seller_category user_id
    render json: cats
  end


end
