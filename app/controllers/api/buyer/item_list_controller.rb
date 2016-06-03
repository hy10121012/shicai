class Api::Buyer::ItemListController < ApplicationController

  def find_item_by_sub_cat
    #从子类获取货品清单
    sub_cat_id = params[:sub_cat_id]
    items = Item.where sub_cat_id: sub_cat_id

    return_map = []
    items.each do |item|
      attr = item.attributes
      attr[:pic] = Item.get_item_pic item
      attr[:unit] = Unit.find_unit_by_item_id item.unit_id
      return_map.push(attr)
    end


    render json: return_map
  end

  def find_frequent_item
    if !session[:user_id].nil?
      items = Item.find_frequent_item(session[:user_id], params[:cat_id])
      return_map = []
      items.each do |item|
        attr = item.attributes
        attr[:pic] =  Item.get_item_pic item
        return_map.push(attr)
      end
      render json: return_map
    end
  end


  def find_item_by_search
    #货品搜索结果
    key_word = params[:key_word]


  end

  def find_sub_cats_by_sub_cat
    #子类页面获取顶部菜单（同大类内子类）
    sub_cat_id = params[:sub_cat_id]
    sub_cats = SubCat.find_all_sub_cats_by_sub_cat_id sub_cat_id

    render json: sub_cats
  end

  def find_sub_cats_by_cat
    #子类页面获取顶部菜单（同大类内子类）
    cat_id = params[:cat_id]
    sub_cats = SubCat.where :category_id=>cat_id

    render json: sub_cats
  end

  def find_item_detail
    #获取货品详细信息
    item = Item.find(params[:item_id])
    attr = item.attributes
    attr[:pic] =  Item.get_item_pic item
    attr[:unit] =Unit.find_unit_by_item_id item.unit_id

    render json:attr


  end

  def add_to_cart
    #添加货品到购物车
    item_id = params[:item_id]
    user_id = session[:user_id]
    qty = params[:quantity]

    cart_item = Cart.find_by :item_id=>item_id,:user_id=>user_id
    if(!cart_item.nil?)
      cart_item.quantity +=qty
      cart_item.save
    else
      cart_item = Cart.new
      cart_item.user_id = user_id
      cart_item.item_id = item_id
      cart_item.quantity = qty
      cart_item.save
    end
    render text: "true"
  end

  def add_to_favor_item
    #添加货物到收藏夹
  end


end
