class UsersController < ApplicationController
  before_action :header_category_parent, only: [:show, :logout, :like]
  
  def index
    
  end

  def new
    @user = User.new
    @user.build_destinations
  end


  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show

  end

  def logout

  end

  def like
    @items = Item.includes(:likes).where(likes: {user_id: current_user})    
  end

  def header_category_parent
    @header_category_parent = Category.roots
  end
end