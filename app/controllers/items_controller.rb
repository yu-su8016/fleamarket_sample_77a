class ItemsController < ApplicationController
  before_action :set_hash, only: [:new, :create]
  def index
    @items = Item.all.order("created_at ASC").limit(4)
  end
  
  def purchase
    
  end

  def new
    @item = Item.new
    10.times { @item.images.build }
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      10.times { @item.images.build }
      render :new
    end
  end

  def show
    @item = Item.find(params[:id]) 
    @category = Category.find(@item.category_id)
    @conditions = Condition.find(@item.condition_id)
    @delivery_fees = DeliveryFee.find(@item.delivery_fee_id)
    @delivery_methods = DeliveryMethod.find(@item.delivery_method_id)
    @prefectures = Prefecture.find(@item.prefecture_id)
    @days = Day.find(@item.day_id)

    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    @likes = Like.new
    # @likes = @item.likes.includes(:user)
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy 
      # if items.user_id == current_user.id
      #   item.destroy 
      # end
  end

  def delete
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
end
