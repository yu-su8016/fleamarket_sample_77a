require 'rails_helper'

describe PurchasesController do
  before do
    it '#@userに期待した値が入っていること' do
      
    end
    it 'Payjp.api_keyが正しいこと' do
      
    end
    it '@itemに期待した値が入っていること' do

    end
    it '@total_priceに期待した値が入っていること' do
      
    end
  end
  describe 'GET #index' do
    content 'userがカードを保有している場合(@user.cardあり)' do
      it '@cardsに期待した値が入っていること' do
        
      end
    end
    content 'userがカードを保有していない(@user.cardなし)' do
      it '@cardsはない' do

      end
    end
    it '#@destinationに期待した値が入っていること' do
      
    end
    it 'index.html.haml に遷移すること' do
      
    end
  end

  describe 'GET #show' do
    content 'params[:id]が1の場合' do
      it '@cardsに期待する値が入っているか' do
      
      end
      it 'show.html.haml に遷移すること' do
        
      end
    end
    content 'params[:id]が2の場合' do
      it '@destinationsに期待する値が入っているか' do
        
      end
      it 'show.html.haml に遷移すること' do
        
      end
    end
  end
  describe 'GET #purchase' do
    content 'userがカードを保有している場合(@user.cardあり)' do
      it '@user.cardが存在すること' do
        
      end
      it 'buyer_idを保存すること' do
        
      end
      it 'after_purchase.html.haml に遷移すること' do
        
      end
    end
    content 'userがカードを保有していない(@user.cardなし)' do
      it 'index.html.haml に遷移すること' do
        
      end
    end
  end

end
