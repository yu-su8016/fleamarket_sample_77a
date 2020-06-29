class Item < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :images, dependent: :destroy
  belongs_to :user, foreign_key: 'seller_id'
  belongs_to :category

  def previous
    Item.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Item.where("id > ?", self.id).order("id ASC").first
  end
 
  accepts_nested_attributes_for :images, allow_destroy: true
end
