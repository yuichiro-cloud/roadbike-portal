class Bike < ApplicationRecord
  def self.search(search)
    if search
      Bike.where(['content LIKE ?', "%#{search}%"])
    else
      Bike.all
    end
  end
  has_many :comments
  # belongs_to :user,optional:true
  # belongs_to :brand,optional: true
  # belongs_to :price,optional: true
  # belongs_to :weight,optional: true
  # belongs_to :model,optional: true
  # has_many :brands
  # has_many :prices
  # has_many :weights
  # has_many :models
  # accepts_nested_attributes_for :brands
  # accepts_nested_attributes_for :models
  # accepts_nested_attributes_for :prices
  # accepts_nested_attributes_for :weights
end
