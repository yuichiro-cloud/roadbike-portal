class Image < ApplicationRecord
  mount_uploader :src, ImageUploader
  belongs_to :bike,optional:true
  # belongs_to :bike
end
