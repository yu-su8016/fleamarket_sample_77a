class Item < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :images
  belongs_to :user, foreign_key: "seller_id"
  belongs_to :category, foreign_key: "category_id"

  accepts_nested_attributes_for :images

  validates :name, presence: true
end
