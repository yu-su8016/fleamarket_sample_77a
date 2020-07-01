class Destination < ApplicationRecord
  belongs_to :user

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true, length: { is: 7}
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :address, presence: true
end
