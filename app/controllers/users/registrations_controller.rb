# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :set_hash, only: [:new, :create]
  
  # GET /resource/sign_up
  def new
    @user = User.new
    @destination = Destination.new
  end

  # POST /resource
  def create
  
    user = User.new(user_params)
    user.save
    sign_in(user)

    @user_id = user.id

    destination = Destination.new(destination_params)
    destination.save

    if params[:user_id]
      @user = User.find(params[:user_id])
      redirect_to users_confirmation_path
    else
      @user = nil
      redirect_to new_user_registration_path, alert: '登録されませんでした'
    end
   
  end
  
  def confirmation
  end

  def after_sign_in_path_for(resource)
    flash[:alert] = "ログインに成功しました" 
    users_confirmation_path
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday)
  end

  def destination_params
    params.require(:destination).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :prefecture_id, :city, :address, :after_address, :phone).merge(user_id: @user_id)
  end

  def set_hash
    @prefectures = Prefecture.all
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.


  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
