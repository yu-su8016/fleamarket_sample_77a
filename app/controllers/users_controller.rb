class UsersController < ApplicationController
  before_action :header_category_parent, only: [:show, :logout, :like]
  
  def show
  end

  def logout
  end

  def like
    @category_parent = Category.roots
    @items = Item.includes(:likes).where(likes: {user_id: current_user})    
  end

  def header_category_parent
    @header_category_parent = Category.roots
  end
end