class PurchasesController < ApplicationController
  before_action :payjp_key
  before_action :set_user

  def index
    if @user.card
      customer = Payjp::Customer.retrieve(@user.card.customer_id)
      @cards = customer.cards.retrieve(params[:card_id])
    end
    @distinations = Destination.find(params[:distinations_id])
  end

  def show
    if params[:id] == '1'
      if @user.card
        customer = Payjp::Customer.retrieve(@user.card.customer_id)
        @cards = customer.cards
      end
    else
      @distinations = Destination.includes(:user).where(users: {id: params[:user_id]})
    end
  end

  def buy
    if @user.card  
      item = Item.find(params[:item_id])
      item.update_attribute(:buyer_id, params[:user_id])
    
      charge = Payjp::Charge.create(
        :amount => item.price,
        :customer => @user.card.customer_id,
        :card => params[:card_id],
        :currency => 'jpy',
      )
    else
      redirect_to action: "index"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    end
  end

  private

  def payjp_key
    require 'payjp'
    Payjp.api_key = Rails.application.credentials.PAYJP[:secret_access_key]
  end

  def set_user
    @user = User.find(params[:user_id])
    ## ユーザー登録機能実装後修正 find()をcurrent_user.idへ
  end

end
