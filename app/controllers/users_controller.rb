class UsersController < ApplicationController
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
    @category_parent = Category.roots
  end

  def logout
    @category_parent = Category.roots
  end


end