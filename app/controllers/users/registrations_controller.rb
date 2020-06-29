# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
    @destination = Destination.new
  end

  # POST /resource
  def create
   
    user = User.new(user_params)
    user.save
    @user_id = user.id

    destination = Destination.new(destination_params)
    destination.save
    
    
    # redirect_to user_items_path(user_id: @user_id)
   
    redirect_to root_path

   
    # user = User.new(user_params)
    # @user_id = user.id
    # destination = Destination.new(destination_params)
    # @user_id = user.id

    # if user.save && destination.save
    #   redirect_to "items#index"
    # else
    #   redirect_to "users/registrations#new"
    # end

    
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday)
  end

  def destination_params
    params.require(:destination).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :prefecture, :city, :address, :after_address, :phone).merge(user_id: @user_id)
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
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
