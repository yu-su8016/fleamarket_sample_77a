class CardsController < ApplicationController
  def index
    require 'payjp'
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    @user = User.find(1)
    ## ユーザー登録機能実装後修正 find()をcurrent_user.idへ
    if @user.card
      customer = Payjp::Customer.retrieve(@user.card.unmber)
      @cards = customer.cards
    end
  end
  
  def create
    require 'payjp'
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    begin
      token = Payjp::Token.create({
        :card => {
          :number => params[:unmber],
          :cvc => params[:security_code],
          :exp_month => params[:limit_month],
          :exp_year => params[:limit_year]
        }},
        {
          'X-Payjp-Direct-Token-Generate': 'true'
        } 
      )
      user = User.find(1)
      ## ユーザー登録機能実装後修正 find()をcurrent_user.idへ
      unless user.card
        customer = Payjp::Customer.create(
          card: token.id
        )
        card = Card.new(user_id: 1, unmber: customer.id, limit_month: 1, limit_year: 1, security_code: 1)
        card.save
        ## ユーザー登録機能実装後修正 user_id: current_user.idへ
      else
        customer = Payjp::Customer.retrieve(user.card.unmber)
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
    require 'payjp'
    Payjp.api_key = 'sk_test_f2fe3643cae56c8189f75bc9'

    user = User.find(1)

    customer = Payjp::Customer.retrieve(user.card.unmber)
    card = customer.cards.retrieve(params[:card_id])
    card.delete
    redirect_to user_cards_path(user_id: 1), alert: '削除しました'
  end

  private
  def card_params
    params.require(:card).permit(:number, :limit_month, :limit_year, :security_code).merge(user_id: 1)
    ## ユーザー登録機能実装後修正,データベース修正後に使う
  end
end
