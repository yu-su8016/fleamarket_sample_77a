class Item < ApplicationRecord
  has_many :likes
  has_many :comments

  has_many :images, dependent: :destroy
  belongs_to :user, foreign_key: "seller_id"
  belongs_to :category, foreign_key: "category_id"

  accepts_nested_attributes_for :images
  # accepts_nested_attributes_for :images, allow_destroy: true
  validates_associated :images 

  validates :name, presence: true, length: { maximum: 40 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :condition_id, :delivery_fee_id, :prefecture_id, :day_id, :delivery_method_id, presence: { message: "を選択してください" }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  validates :images, presence: { message: "を登録してください" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day
  belongs_to_active_hash :delivery_method

  def previous
    Item.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Item.where("id > ?", self.id).order("id ASC").first
  end

end
