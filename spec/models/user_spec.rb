require 'rails_helper'


describe User do
  describe '#create' do
    # 1
    it "nicknameとemail、passwordとpassword_confirmation、passwordは７桁以上、family_nameとfirst_name、family_name_kanaとfirst_name_kana、birthdayが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2
    it " nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    # 3
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください", "は不正な値です")
    end

    # 4
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください", "は7文字以上で入力してください")
    end

    # 5
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません", "を入力してください")
    end

    # 6
    it " passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    # 7
    it " passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      expect(user).to be_valid
    end

    # 8
    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    # 9
    it " family_nameがない場合は登録できないこと" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください", "は不正な値です")
    end

    # 10
    it " family_name全角でない場合は登録できないこと" do
      user = build(:user, family_name: "yamada")
      user.valid?
      expect(user.errors[:family_name]).to include("は不正な値です")
    end

    # 11
    it " first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください", "は不正な値です")
    end

    # 12
    it " first_nameが全角でない場合は登録できないこと" do
      user = build(:user, first_name: "taro")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    # 13
    it " family_name_kanaがない場合は登録できないこと" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください", "は不正な値です")
    end
    
    # 14
    it " family_name_kanaがひらがなでない場合は登録できないこと" do
      user = build(:user, family_name_kana: "ヤマダ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は不正な値です")
    end

    # 15
    it " first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください", "は不正な値です")
    end

    # 16
    it " first_name_kanaがひらがなでない場合は登録できないこと" do
      user = build(:destination, first_name_kana: "タロウ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    # 17
    it " birthdayがない場合は登録できないこと" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

  end
end