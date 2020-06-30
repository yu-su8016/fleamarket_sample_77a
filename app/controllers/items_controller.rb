class ItemsController < ApplicationController

  before_action :set_hash, only: [:new, :create]
  def index
  end
  def purchase
    
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to "/"
    else
      render 'new'
    end
  end

  private

  def set_hash
    @conditions = Condition.all
    @delivery_fees = DeliveryFee.all
    @delivery_methods = DeliveryMethod.all
    @prefectures = Prefecture.all
    @days = Day.all
  end

  def item_params
    params.permit(:name, :explanation, :category_id, :brand, :size, :condition_id, :delivery_fee_id, :prefecture_id, :day_id, :delivery_method_id, :price).merge(seller_id: 1)
  end
end
