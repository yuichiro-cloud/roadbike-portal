class Bike < ApplicationRecord
  has_many :comments
  has_many :images
  belongs_to :user
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :brand,:weight,:price,:model, presence: true  
  validates :images, presence: true
end
