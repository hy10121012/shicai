class Buyer::ItemController < ApplicationController
  layout 'layout_buyer'

  def item_detail
    @id = params[:item_id]
    item = Item.find @id
    @title=item.name
  end
end
