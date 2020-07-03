class ItemsController < ApplicationController
  before_action :set_hash, only: [:new, :create ,:edit ,:update]
  def index
    @items = Item.all.order("created_at ASC").limit(4)
  end
  def purchase
  end
  def show
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
  end


  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
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
    params.require(:item).permit(:name, :explanation, :category_id, :brand, :size, :condition_id, :delivery_fee_id, :prefecture_id, :day_id, :delivery_method_id, :price, images_attributes: [:id, :images]).merge(seller_id: 1)
  end

  # def item_update_params
  #   params.require(:item).permit(:name,[images_attributes: [:image, :_destroy, :id]])
  # end
end
