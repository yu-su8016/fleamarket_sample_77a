class CardsController < ApplicationController
  before_action :payjp_key
  before_action :set_user

  def index
    if @user.card
      customer = Payjp::Customer.retrieve(@user.card.customer_id)
      @cards = customer.cards
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
        ## ユーザー登録機能実装後修正 user_id: current_user.idへ
      else
        customer = Payjp::Customer.retrieve(@user.card.customer_id)
        customer.cards.create(
          card: token.id
        )
      end
      redirect_to user_cards_path(user_id: 1), notice: '登録されました'

    rescue
      redirect_to user_cards_path(user_id: 1), alert: '登録できませんでした'
    end
  end

  def delete
    customer = Payjp::Customer.retrieve(@user.card.customer_id)
    card = customer.cards.retrieve(params[:card_id])
    card.delete
    redirect_to user_cards_path(user_id: 3), alert: '削除しました'
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
