require 'rails_helper'
describe Destination do
  describe '#create' do
    # 1
    it "family_nameとfirst_name、family_name_kanaとfirst_name_kana、postal_codeは７桁、prefecture_idとcityとaddressが存在すれば登録できること" do
      destination = build(:destination)
      expect(destination).to be_valid
    end

    # 2
    it " family_nameがない場合は登録できないこと" do
      destination = build(:destination, family_name: nil)
      destination.valid?
      expect(destination.errors[:family_name]).to include("を入力してください")
    end
    
    # 3
    it " family_name全角でない場合は登録できないこと" do
      destination = build(:destination, family_name: "yamada")
      destination.valid?
      expect(destination.errors[:family_name]).to include("は不正な値です")
    end

    # 4
    it " first_nameがない場合は登録できないこと" do
      destination = build(:destination, first_name: nil)
      destination.valid?
      expect(destination.errors[:first_name]).to include("を入力してください")
    end

    # 5
    it " first_nameが全角でない場合は登録できないこと" do
      destination = build(:destination, first_name: "taro")
      destination.valid?
      expect(destination.errors[:first_name]).to include("は不正な値です")
    end

    # 6
    it " family_name_kanaがない場合は登録できないこと" do
      destination = build(:destination, family_name_kana: nil)
      destination.valid?
      expect(destination.errors[:family_name_kana]).to include("を入力してください")
    end

    # 7
    it " family_name_kanaがひらがなでない場合は登録できないこと" do
      destination = build(:destination, family_name_kana: "ヤマダ")
      destination.valid?
      expect(destination.errors[:family_name_kana]).to include("は不正な値です")
    end


    # 8
    it " first_name_kanaがない場合は登録できないこと" do
      destination = build(:destination, first_name_kana: nil)
      destination.valid?
      expect(destination.errors[:first_name_kana]).to include("を入力してください")
    end

    # 9
    it " first_name_kanaがひらがなでない場合は登録できないこと" do
      destination = build(:destination, first_name_kana: "タロウ")
      destination.valid?
      expect(destination.errors[:first_name_kana]).to include("は不正な値です")
    end

    # 10
    it " postal_codeが7文字でなければ登録できないこと " do
      destination = build(:destination, postal_code: "0000000")
      destination.valid?
      expect(destination.errors[:postal_code])
    end

    # 11
    it " prefectureがない場合は登録できないこと" do
      destination = build(:destination, prefecture_id: nil)
      destination.valid?
      expect(destination.errors[:prefecture_id]).to include("を入力してください")
    end

    # 12
    it " cityがない場合は登録できないこと" do
      destination = build(:destination, city: nil)
      destination.valid?
      expect(destination.errors[:city]).to include("を入力してください")
    end

    # 13
    it " addressがない場合は登録できないこと" do
      destination = build(:destination, address: nil)
      destination.valid?
      expect(destination.errors[:address]).to include("を入力してください")
    end

  end
end