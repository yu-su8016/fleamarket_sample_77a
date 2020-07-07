class ItemsController < ApplicationController
  before_action :set_hash, only: [:new, :create]
  before_action :item_find_params, only: [:create, :show, :destroy]

  def index
    @items = Item.all.order("created_at ASC").limit(4)
  end
 
  def new
    @item = Item.new
    10.times { @item.images.build }
  end

  def create
    if @item.save
      redirect_to root_path
    else
      10.times { @item.images.build }
      render :new
    end
  end

  def show
    @category = Category.find(@item.category_id)
    @conditions = Condition.find(@item.condition_id)
    @delivery_fees = DeliveryFee.find(@item.delivery_fee_id)
    @delivery_methods = DeliveryMethod.find(@item.delivery_method_id)
    @prefectures = Prefecture.find(@item.prefecture_id)
    @days = Day.find(@item.day_id)

    destinations = Destination.includes(:user).where(users: {id: current_user})
    @destination = destinations[0]
    @like = Like.find_by(user_id: current_user.id, item_id: params[:id])
  end
  
  def destroy
    if @item.user.id == current_user.id && @item.destroy
      redirect_to root_path, notice: "削除が完了しました"
    else
      redirect_to root_path, alert: "削除が失敗しました"
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

  def item_find_params
    @item = Item.find(params[:id]) 
  end

end
