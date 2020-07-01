class ItemsController < ApplicationController
  def index
  end
  def show
    @user = User.find(params[:user_id])
    require 'payjp'
    Payjp.api_key = Rails.application.credentials.PAYJP[:secret_access_key]
    ## ユーザー登録機能実装後修正 find()をcurrent_user.idへ
    if @user.card
      customer = Payjp::Customer.retrieve(@user.card.customer_id)
      @cards = customer.cards.data[0].id
    end
    destinations = Destination.includes(:user).where(users: {id: params[:user_id]})
    @destinations = destinations[0]
  end
end
