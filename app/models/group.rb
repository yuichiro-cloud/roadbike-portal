class Group < ApplicationRecord
  has_many :chats
  validates :name, presence: true
end
