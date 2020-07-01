class ItemsController < ApplicationController
  def index
    @items = Item.all.order("id DESC").limit(4)
  end
  def purchase
    
  end
end
