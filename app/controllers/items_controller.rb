class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show, :search]
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @image = @item.images.build
  end

  def show
    @item = Item.find(params[:id]) 
    @category = Category.find(@item.category_id)
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
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
