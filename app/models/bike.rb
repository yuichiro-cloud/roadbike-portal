class Bike < ApplicationRecord
  def self.search(search)
    if search
      Bike.where(['content LIKE ?', "%#{search}%"])
    else
      Bike.all
    end
  end
  has_many :comments
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
end
