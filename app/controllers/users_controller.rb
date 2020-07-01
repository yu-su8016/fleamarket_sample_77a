class UsersController < ApplicationController
  def index
    
  end

  def new
    @user = User.new
    @user.build_destinations
   
  end


  def create
    @user = User.new(user_params)
    @user.save
    
    redirect_to root_path

    
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

  private

  def user_params
    params.require(:user).permit(:email, :password, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, destinations_attributes:[:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :prefecture, :city, :address, :after_address, :phone])
  end

  def destinations_params
    params.require(:destinations).permit(destinations:[:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :prefecture, :city, :address, :after_address, :phone])
  end
end