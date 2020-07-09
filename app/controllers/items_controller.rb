class ItemsController < ApplicationController
  before_action :set_hash, only: [:new, :create, :edit, :update]
  before_action :item_find_params, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: :header_category

  def index
    @items = Item.all.order("created_at ASC").limit(4)
    @category_parent = Category.roots
  end

  def purchase
    
  end

  def new
    @item = Item.new
    10.times { @item.images.build }
    @category_parent_array = Category.where(ancestry: nil)
  end

  def create
    @item = Item.new(item_params)
    @category_parent_array = Category.where(ancestry: nil)
    if @item.save
      redirect_to root_path
    else
      10.times { @item.images.build }
      render :new
    end
  end

  def edit
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
  end


  def show
    @category_parent = Category.where(ancestry:nil)
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

  def search
    @items = Item.search(params[:search])
    @category_parent = Category.roots
  end
 
  def header_category
    @category_children = Category.find_by(id: params[:category_id]).children.map { |category| [category[:id], category[:name]] }.to_h
    render json: @category_children
  end

  def category_children
    @category_children = Category.find(params[:parent_id] ).children
  end

  def category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
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
    params.require(:item).permit(:name, :explanation, :category_id, :brand, :size, :condition_id, :delivery_fee_id, :prefecture_id, :day_id, :delivery_method_id, :price, images_attributes: [:id, :image]).merge(seller_id: 1)
  end

  def item_find_params
    @item = Item.find(params[:id]) 
  end

end
