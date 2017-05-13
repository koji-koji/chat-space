class Chatgroup < ApplicationRecord
  validates :group_name, uniqueness: true, presence: true
  has_many :users, through: :chatgroup_users
  has_many :chatgroup_users
  has_many :comments
end
