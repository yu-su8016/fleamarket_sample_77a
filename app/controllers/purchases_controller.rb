class PurchasesController < ApplicationController
  before_action :payjp_key
  before_action :set_user
  before_action :set_item, except: :show

  def index
    if @user.card
      customer = Payjp::Customer.retrieve(@user.card.customer_id)
      if params[:card_id]
        @cards = customer.cards.retrieve(params[:card_id])
      else
        @cards = customer.cards.data[0]
      end
    end
    @destination = Destination.find(params[:destination_id])
  end

  def show
    if params[:id] == '1'
      customer = Payjp::Customer.retrieve(@user.card.customer_id)
      @cards = customer.cards
    else
      @destinations = Destination.includes(:user).where(users: {id: current_user.id})
    end
  end

  def purchase
    @item.update_attribute(:buyer_id, current_user.id)
    charge = Payjp::Charge.create(
      :amount => @total_price,
      :customer => @user.card.customer_id,
      :card => params[:card_id],
      :currency => 'jpy',
    )
    redirect_to action: :after_purchase
  end

  def after_purchase
  end

  private

  def payjp_key
    require 'payjp'
    Payjp.api_key = Rails.application.credentials.PAYJP[:secret_access_key]
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
    @total_price = @item.delivery_fee_id.to_i + @item.price
  end

end
