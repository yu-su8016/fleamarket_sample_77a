class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :item, optional: true
  # validates :image, presence: true, length: {manimum: 1, maximum: 5}
  
end
