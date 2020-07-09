class CardsController < ApplicationController
  before_action :payjp_key
  before_action :set_user

  def index
    @category_parent = Category.roots
    if @user.card
      customer = Payjp::Customer.retrieve(@user.card.customer_id)
      cards = customer.cards
      if cards.data[0]
        @cards = cards
      end
    end
  end
  
  def create
    begin
      token = Payjp::Token.create({
        :card => {
          :number => params[:number],
          :cvc => params[:cvc],
          :exp_month => params[:exp_month],
          :exp_year => params[:exp_year]
        }},
        {
          'X-Payjp-Direct-Token-Generate': 'true'
        } 
      )
      unless @user.card
        customer = Payjp::Customer.create(
          card: token.id
        )
        card = Card.new(user_id: @user.id, customer_id: customer.id)
        card.save
        redirect_to action: :index
        flash[:notice] = '登録されました'
      else
        customer = Payjp::Customer.retrieve(@user.card.customer_id)
        customer.cards.create(
          card: token.id
        )
        redirect_to action: :index
        flash[:notice] = '登録されました'
      end
    rescue
      redirect_to action: :index
      flash[:alert] = '登録できませんでした　内容に誤りがあります'
    end
  end

  def delete
    customer = Payjp::Customer.retrieve(@user.card.customer_id)
    card = customer.cards.retrieve(params[:card_id])
    card.delete
    redirect_to action: :index
    flash[:alert] = '削除しました'
  end

  private

  def payjp_key
    require 'payjp'
    Payjp.api_key = Rails.application.credentials.PAYJP[:secret_access_key]
  end

  def set_user
    @user = User.find(current_user.id)
  end

end
