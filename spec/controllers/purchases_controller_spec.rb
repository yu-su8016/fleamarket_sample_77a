require 'rails_helper'
include AuthHelper
include ControllerMacros

describe PurchasesController do
  before do 
    basic_login
    login(user)
  end
  let(:user) { create(:user) }
  let(:buyer) { create(:user) }
  let(:item) { create(:item, seller_id: user.id)}
  let(:destination) { create(:destination, user_id: user.id)}
  let(:params) {{ user_id: user.id, item_id: item.id, destination_id: destination.id}}
  describe 'GET #index' do
    it '@userに期待した値が入っていること' do
      get :index, params: params
      expect(assigns(:user)).to eq user
    end
    it '@itemに期待した値が入っていること' do
      get :index, params: params
      expect(assigns(:item)).to eq item
    end
    context 'userがカードを保有している場合(@user.cardあり)' do
      before do
        @card = create(:card, user_id: user.id)
        @payjp_customer = double("Payjp::Customer")
        allow(Payjp::Customer).to receive(:retrieve).and_return(@payjp_customer)
      end
      context 'params[:card_id]がある場合' do
        before do
          params[:card_id] = @card.id
          payjp_cards = double("Payjp::Cards")
          @payjp_card = double("Payjp::Card")
          allow(@payjp_customer).to receive(:cards).and_return(payjp_cards)
          allow(payjp_cards).to receive(:retrieve).and_return(@payjp_card) 
        end
        it '@cardsに期待した値が入っていること' do
          get :index, params: params
          expect(assigns(:cards)).to eq @payjp_card
        end
        it 'index.html.haml に遷移すること' do
          get :index, params: params
          expect(response).to render_template :index
        end
      end
      context 'params[:card_id]がない場合' do
        before do
          payjp_customer = double("Payjp::Customer")
          payjp_cards = double("Payjp::Cards")
          @payjp_mock_card = PayjpMock.payjp_mock
          allow(Payjp::Customer).to receive(:retrieve).and_return(payjp_customer) 
          allow(payjp_customer).to receive(:cards).and_return(payjp_cards)
          allow(payjp_cards).to receive(:data).and_return(@payjp_mock_card) 
        end
        it '@cardsに期待した値が入っていること' do
          get :index, params: params
          expect(assigns(:cards)).to eq @payjp_mock_card[0]
        end
        it 'index.html.haml に遷移すること' do
          get :index, params: params
          expect(response).to render_template :index
        end
      end
    end
    context 'userがカードを保有していない(@user.cardなし)' do
      it 'index.html.haml に遷移すること' do
        get :index, params: params
        expect(response).to render_template :index
      end
    end
  end
  describe 'GET #show' do
    context 'params[:id]が1の場合' do
      before do
        params[:id] = "1"
        card = create(:card, user_id: user.id)
        payjp_customer = double("Payjp::Customer")
        @payjp_cards = double("Payjp::Cards")
        allow(Payjp::Customer).to receive(:retrieve).and_return(payjp_customer) 
        allow(payjp_customer).to receive(:cards).and_return(@payjp_cards)
      end
      it '@cardsに期待する値が入っているか' do
        get :show, params: params
        expect(assigns(:cards)).to eq @payjp_cards
      end
      it 'show.html.haml に遷移すること' do
        get :show, params: params
        expect(response).to render_template :show
      end
    end
    context 'params[:id]が2の場合' do
      before do
        params[:id] = 2
      end
      it '@destinationsに期待する値が入っているか' do
        get :show, params: params
        expect(assigns(:destinations)).to include destination
      end
      it 'show.html.haml に遷移すること' do
        get :show, params: params
        expect(response).to render_template :show
      end
    end
  end
  describe 'GET #purchase' do
    before do
      card = create(:card, user_id: user.id)
      item[:buyer_id] = buyer.id
      payjp_charge = double("Payjp::Charge")
      allow(Payjp::Charge).to receive(:create).and_return(payjp_charge)
    end
    it 'after_purchase.html.haml に遷移すること' do
      get :purchase, params: params
      expect(response).to redirect_to after_purchase_item_purchases_path(item_id: item.id)
    end
  end
end
