# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :set_hash, only: [:new, :create]
  
  # GET /resource/sign_up
  def new
    @user = User.new
    @destination = @user.destinations.new
  end

  # POST /resource
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_confirmation_path
      flash[:notice] = "ログインに成功しました"
      sign_in(@user)
    else
      flash[:alert] = "登録されませんでした"
      render :new
    end   
  end
  
  def confirmation
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, destinations_attributes: [:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :prefecture_id, :city, :address, :after_address, :phone, user_id: current_user])
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
