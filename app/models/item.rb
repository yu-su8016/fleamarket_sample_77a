class Item < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :images
  belongs_to :user
  belongs_to :category
end
