class Group < ApplicationRecord
  has_many :chats
  has_many :users, through: :users_groups
  validates :name, presence: true
end
