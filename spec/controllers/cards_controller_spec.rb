require 'rails_helper'
include AuthHelper

describe CardsController do
  before {basic_login}
  let(:user) { create(:user) }
  let(:item) { create(:item, seller_id: user.id) }
  let(:params) {{ user_id: user.id, item_id: item.id }}
  describe 'GET #index' do
    it '#@userに期待した値が入っていること' do
      get :index, params: params
      expect(assigns(:user)).to eq user
    end
    context 'userがカードを保有している場合(@user.cardあり)' do
      before do
        card = create(:card, user_id: user.id)
        payjp_customer = double("Payjp::Customer")
        @payjp_cards = double("Payjp::Cards")
        allow(Payjp::Customer).to receive(:retrieve).and_return(payjp_customer) 
        allow(payjp_customer).to receive(:cards).and_return(@payjp_cards)
      end
      it '@cardsに期待した値が入っていること' do
        get :index, params: params
        expect(assigns(:cards)).to eq @payjp_cards
      end
      it 'index.html.haml に遷移すること' do
        get :index, params: params
        expect(response).to render_template :index
      end
    end
    context 'userがカードを保有していない@user.cardなし' do
      it 'index.html.haml に遷移すること' do
        get :index, params: params
        expect(response).to render_template :index
      end
    end
  end
  describe 'POST #create' do
    context 'tokenが作られる場合' do
      before do
        payjp_token = double("Payjp::Token", id: 1)
        allow(Payjp::Token).to receive(:create).and_return(payjp_token)
      end
      context 'カードの登録が初めての場合(@user.cardなし)' do
        before do
          payjp_customer = double("Payjp::Customer", id: 'cus_121673955bd7aa144de5a8f6c262')
          allow(Payjp::Customer).to receive(:create).and_return(payjp_customer)
          params[:customer_id] = payjp_customer.id
        end
        it 'index.html.haml に遷移すること' do
          post :create, params: params
          expect(response).to redirect_to user_cards_path
        end
      end
      context 'カードの登録が2回目以降の場合(@user.cardあり)' do
        before do
          card = create(:card, user_id: user.id)
          payjp_customer = double("Payjp::Customer")
          payjp_cards = double("Payjp::Cards")
          payjp_card_create = double("Payjp::CardCreate")
          allow(Payjp::Customer).to receive(:retrieve).and_return(payjp_customer) 
          allow(payjp_customer).to receive(:cards).and_return(payjp_cards)
          allow(payjp_cards).to receive(:create).and_return(payjp_card_create)
        end
        it 'index.html.haml に遷移すること' do
          post :create, params: params
          expect(response).to redirect_to user_cards_path
        end
      end
    end
    context 'tokenが作られない場合' do
      it 'index.html.haml に遷移すること' do
        post :create, params: params
        expect(response).to redirect_to user_cards_path
      end
    end
    
  end
  describe '#delete' do
    before do
      card = create(:card, user_id: user.id)
      payjp_customer = double("Payjp::Customer")
      payjp_cards = double("Payjp::Cards")
      payjp_card = double("Payjp::Card")
      allow(Payjp::Customer).to receive(:retrieve).and_return(payjp_customer) 
      allow(payjp_customer).to receive(:cards).and_return(payjp_cards)
      allow(payjp_cards).to receive(:retrieve).and_return(payjp_card)
      allow(payjp_card).to receive(:delete)
    end
    it 'index.html.haml に遷移すること' do
      get :delete, params: params
      expect(response).to redirect_to user_cards_path
    end
  end

end
