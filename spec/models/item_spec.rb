require 'rails_helper'

RSpec.describe Item, type: :model do

  describe '画像' do
    
    context '画像が1枚以上ある場合' do
      it '出品ができること' do
        image = build(:item)
        expect(image).to be_valid
      end
    end
    context '画像がない場合' do
      it '出品ができないこと' do
        image = build(:no_image_item)
        expect(image).not_to be_valid
      end
    end
  end

  describe '商品名' do
    context '商品名がある場合' do
      it '出品ができること' do
        item = build(:item)
        expect(item).to be_valid
      end
    end
    context '商品名がない場合' do
      it '出品ができないこと' do
        item = build(:item, name: "")
        expect(item).not_to be_valid
      end
    end
    context '商品名が40文字以下の場合' do
      it '出品ができること' do
        item = build(:item, name: "a" * 40)
        expect(item).to be_valid
      end
    end
    context '商品名が41文字以上ある場合' do
      it '出品ができないこと' do
        item = build(:item, name: "a" * 41)
        expect(item).not_to be_valid
      end
    end
  end

  describe '商品の説明' do
    context '説明文がある場合' do
      it '出品ができること' do
        item = build(:item)
        expect(item).to be_valid
      end
    end
    context '説明文がない場合' do
      it '出品ができないこと' do
        item = build(:item, explanation: "")
        expect(item).not_to be_valid
      end
    end
    context '説明文が1,000文字以下の場合' do
      it '出品ができること' do
        item = build(:item, explanation: "a" * 1000)
        expect(item).to be_valid
      end
    end
    context '説明文が1,001文字以上ある場合' do
      it '出品ができないこと' do
        item = build(:item, explanation: "a" * 1001)
        expect(item).not_to be_valid
      end
    end
  end

  describe 'カテゴリー' do
    context 'カテゴリーが選択されている場合' do
      it '出品ができること' do
        item = build(:item)
        expect(item).to be_valid
      end
    end
    context 'カテゴリーが選択されていない場合' do
      it '出品ができないこと' do
        item = build(:item, category_id: "")
        expect(item).not_to be_valid
      end
    end
  end

  describe 'ブランド' do
    context 'ブランド名がある場合' do
      it '出品ができること' do
        item = build(:item)
        expect(item).to be_valid
      end
    end
    context 'ブランド名がない場合' do
      it '出品ができること' do
        item = build(:item, brand: "")
        expect(item).to be_valid
      end
    end
  end

  describe '商品のサイズ' do
    context 'サイズが入力されている場合' do
      it '出品ができること' do
        item = build(:item)
        expect(item).to be_valid
      end
    end
    context 'サイズが入力がされていない場合' do
      it '出品ができること' do
        item = build(:item, size: "")
        expect(item).to be_valid
      end
    end
  end

  describe '商品の状態' do
    context '状態が選択されている場合' do
      it '出品ができること' do
        item = build(:item)
        expect(item).to be_valid
      end
    end
    context '状態が選択されていない場合' do
      it '出品ができないこと' do
        item = build(:item, condition_id: "")
        expect(item).not_to be_valid
      end
    end
  end

  describe '配送料の負担' do
    context '負担者が選択されている時' do
      it '出品ができること' do
        item = build(:item)
        expect(item).to be_valid
      end
    end
    context '負担者が選択されていない場合' do
      it '出品ができないこと' do
        item = build(:item, delivery_fee_id: "")
        expect(item).not_to be_valid
      end
    end
  end

  describe '発送の方法' do
    context '方法が選択されている場合' do
      it '出品ができること' do
        item = build(:item)
        expect(item).to be_valid
      end
    end
    context '方法が選択されていない場合' do
      it '出品ができないこと' do
        item = build(:item, delivery_method_id: "")
        expect(item).not_to be_valid
      end
    end
  end

  describe '配送元の地域' do
    context '地域が選択されている場合' do
      it '出品できること' do
        item = build(:item)
        expect(item).to be_valid
      end
    end
    context '地域が選択されていない場合' do
      it '出品できないこと' do
        item = build(:item, prefecture_id: "")
        expect(item).not_to be_valid
      end
    end
  end

  describe '発送までの日数' do
    context '日数が選択されている場合' do
      it '出品できること' do
        item = build(:item)
        expect(item).to be_valid
      end
    end
    context '日数が選択されている場合' do
      it '出品できないこと' do
        item = build(:item, day_id: "")
        expect(item).not_to be_valid
      end
    end
  end

  describe '価格' do
    context '価格の入力がされている場合' do
      it '出品できること' do
        item = build(:item)
        expect(item).to be_valid
      end
    end
    context '価格の入力がされていない場合' do
      it '出品できないこと' do
        item = build(:item, price: "")
        expect(item).not_to be_valid
      end
    end
    context '299円以下の場合'  do
      it '出品できないこと' do
        item = build(:item, price: 299)
        expect(item).not_to be_valid
      end
    end
    context '300円以上の場合' do
      it '出品できること' do
        item = build(:item, price: 300)
        expect(item).to be_valid
      end
    end
    context '9,999,999円以下の場合' do
      it '出品できること' do
        item = build(:item, price: 9999999)
        expect(item).to be_valid
      end
    end
    context '10,000,000円以上の場合' do
      it '出品できないこと' do
        item = build(:item, price: 10000000)
        expect(item).not_to be_valid
      end
    end
  end 

  describe '#search' do

    let(:red_bag) { create(:item, name: '赤い鞄') }
    let(:red_clothes) { create(:item, name: '赤い服') }

    context '"鞄"で検索した場合' do
      it '"red_bag"が検索されること' do
        expect(Item.search("鞄")).to include(red_bag)
      end
      
      it '"red_clothes"が検索されないこと' do
        expect(Item.search("鞄")).to_not include(red_clothes)
      end
    end

    context '"靴"で検索した場合' do
      it '何も検索されないこと' do
        expect(Item.search("靴")).to be_empty
      end
    end
  end

end