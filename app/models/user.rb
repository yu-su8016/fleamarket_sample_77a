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
  validates_associated :destinations

  domein = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  hiragana = /\A[ぁ-んー－]+\z/
  zennkaku = /\A[ぁ-んァ-ン一-龥]/

  validates :nickname, presence: true
  validates :email, presence: true, format: { with:  domein }, uniqueness: true
  validates :password, presence: true, length: { minimum: 7 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :family_name, presence: true, format: { with:  zennkaku }
  validates :first_name, presence: true, format: { with:  zennkaku }
  validates :family_name_kana, presence: true, format: { with:  hiragana }
  validates :first_name_kana, presence: true, format: { with:  hiragana }
  validates :birthday, presence: true
  

end
