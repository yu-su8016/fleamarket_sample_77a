class ItemsController < ApplicationController

  before_action :set_hash, only: [:new, :create, :edit, :update]
  before_action :item_find_params, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: :header_category
  before_action :header_category_parent, only: [:index, :show, :search,]

  def index
    @items = Item.all.order("created_at DESC").limit(4)
    @category_parent = Category.roots
  end

  def purchase
  end

  def show
  end

 
  def new
    @item = Item.new
    @item.images.new
    9.times { @item.images.build }
    @category_parent_array = Category.where(ancestry: nil)
  end

  def create
    @item = Item.new(item_params)
    @category_parent_array = Category.where(ancestry: nil)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    9.times { @item.images.build }
    @category = Category.find(@item.category_id)
    if @category.root?
      @parent_category = @category
      @parent_category_array = @parent_category.siblings

    elsif @category.ancestors? && @category.children?
      @child_category = @category
      @childern_category_array = @child_category.siblings

      @parent_category = @child_category.parent
      @parent_category_array = @parent_category.siblings

    else
      @grandchild_category = @category
      @grandchildren_category_array = @grandchild_category.siblings

      @child_category = @grandchild_category.parent
      @childern_category_array = @child_category.siblings

      @parent_category = @child_category.parent      
      @parent_category_array = @parent_category.siblings
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def image_delete
    image = Image.find(params[:image_id])
    image.destroy
  end

  def show
    @category_parent_show = Category.where(ancestry:nil)
    @category = Category.find(@item.category_id)
    @conditions = Condition.find(@item.condition_id)
    @delivery_fees = DeliveryFee.find(@item.delivery_fee_id)
    @delivery_methods = DeliveryMethod.find(@item.delivery_method_id)
    @prefectures = Prefecture.find(@item.prefecture_id)
    @days = Day.find(@item.day_id)

    destinations = Destination.includes(:user).where(users: {id: current_user})
    @destination = destinations[0]
    if user_signed_in?
      @like = Like.find_by(user_id: current_user.id, item_id: params[:id])
      
    end
  end
  
  def destroy
    if @item.user.id == current_user.id && @item.destroy
      redirect_to root_path, notice: "削除が完了しました"
    else
      redirect_to root_path, alert: "削除が失敗しました"
    end
  end

  def search
    @items = Item.search(params[:search])
  end
 
  def header_category
    @header_category_children = Category.find_by(id: params[:category_id]).children.map { |category| [category[:id], category[:name]] }.to_h
    render json: @header_category_children
  end

  def category_children
    @category_children = Category.find(params[:parent_id] ).children
  end

  def category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  def header_category_parent
    @header_category_parent = Category.roots
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
