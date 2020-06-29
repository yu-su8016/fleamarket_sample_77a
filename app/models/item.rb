class Item < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :images
  belongs_to :user, foreign_key: "seller_id"
  belongs_to :category, foreign_key: "category_id"

  accepts_nested_attributes_for :images

  validates :name, presence: true, length: { maximum: 40 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :condition, :delivery_fee, :prefecture, :day, :delivery_method, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
