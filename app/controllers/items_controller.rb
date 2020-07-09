class ItemsController < ApplicationController
  before_action :set_hash, only: [:new, :create ,:edit ,:update]
  before_action :item_find_params, only: [:show, :destroy, :edit]


  def index
    @items = Item.all.order("created_at DESC").limit(4)
  end

  def purchase
  end

  def show
  end

 
  def new
    @item = Item.new
    @item.images.new
    9.times { @item.images.build }
  end

  def create
    @item = Item.new(item_params)
    binding.pry
    if @item.save
      redirect_to root_path
    else
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
  end
  
  def destroy
    if @item.user.id == current_user.id && @item.destroy
      redirect_to root_path, notice: "削除が完了しました"
    else
      redirect_to root_path, alert: "削除が失敗しました"
    end
  end

  def edit
    # binding.pry
    @item = Item.find(params[:id])
    binding.pry
    # 9.times { @item.images.build }
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
    params.require(:item).permit(:name, :explanation, :brand, :price, :size, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :day_id, :delivery_method_id, images_attributes: [:image, :_destroy,:id]).merge(seller_id: current_user.id)
  end

  def item_find_params
    @item = Item.find(params[:id]) 
  end

end
