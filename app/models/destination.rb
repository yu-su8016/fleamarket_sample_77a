class Destination < ApplicationRecord
  belongs_to :user

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true, length: { is: 7}
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
