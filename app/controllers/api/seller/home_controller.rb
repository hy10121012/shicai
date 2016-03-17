class Api::Seller::HomeController < ApplicationController

  def find_selling_items
    user_id = params[:user_id]
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
    user_id = params[:user_id]
    Category.find_seller_category user_id
  end


end
