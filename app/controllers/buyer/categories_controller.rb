class Buyer::CategoriesController < ApplicationController
  layout 'layout_buyer'
  def index
    @title='商品分类'

  end

  def show_by_cat

    @id=params[:cat_id]
    cat = Category.find @id
    @title=cat.name
  end

  def show_by_sub_cat
    @id=params[:sub_cat_id]
  end

  def show_favor
  end
end
