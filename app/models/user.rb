class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :destinations
  has_many :cards
  has_many :likes
  has_many :comments

  accepts_nested_attributes_for :destinations 
  # コメントアウトで住所テーブル以外は登録できる
end
