class Image < ApplicationRecord
  belongs_to :item, optional: true

  validates :images, presence: true
end
