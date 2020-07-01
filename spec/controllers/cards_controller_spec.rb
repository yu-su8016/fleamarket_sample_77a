require 'rails_helper'

describe CardsController do
  before do
    it '#@userに期待した値が入っていること' do
      
    end
    it 'Payjp.api_keyが正しいこと' do
      
    end
  end
  describe 'GET #index' do
    content 'userがカードを保有している場合(@user.cardあり)' do
      it '@cardsに期待した値が入っていること' do
        
      end
      it 'index.html.haml に遷移すること' do
        
      end
    end
    content 'userがカードを保有していない@user.cardなし' do
      it '@cardsはない' do
      end
    end
  end

  describe 'POST #create' do
    content 'tokenが作られる場合' do
      content 'カードの登録が初めての場合(@user.cardなし)' do
        it 'Payjpのcustomerオブジェクトを作ること' do
          
        end
        it 'costomerオブジェクトにcardオブジェクトを登録すること' do
          
        end
        it 'cardを保存すること' do
        
        end
        it 'index.html.haml に遷移すること' do
        
        end
      end
      content 'カードの登録が2回目以降の場合(@user.cardあり)' do
        it 'Payjpのcostomerオブジェクトを呼び出すこと' do
          
        end
        it 'costomerオブジェクトにカードを登録すること' do
          
        end
        it 'index.html.haml に遷移すること' do
          
        end
      end
    end
    content 'tokenが作られない場合' do
      it 'index.html.haml に遷移すること' do
          
      end
    end
    
  end
  describe '#delete' do
    it 'Payjpのcostomerオブジェクトを呼び出すこと' do
      
    end
    it 'costomerオブジェクトのcardオブジェクトを呼び出すこと' do
      
    end
    it 'cardオブジェクトを削除すること' do
      
    end
    it 'index.html.haml に遷移すること' do
          
    end
  end

end
