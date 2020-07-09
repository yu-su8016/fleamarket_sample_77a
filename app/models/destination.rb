class Destination < ApplicationRecord
  belongs_to :user

  hiragana = /\A[ぁ-んー－]+\z/
  zennkaku = /\A[ぁ-んァ-ン一-龥]/

  validates :family_name, presence: true, format: { with:  zennkaku }
  validates :first_name, presence: true, format: { with:  zennkaku }
  validates :family_name_kana, presence: true, format: { with:  hiragana }
  validates :first_name_kana, presence: true, format: { with:  hiragana }
  validates :postal_code, presence: true, length: { is: 7}
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
