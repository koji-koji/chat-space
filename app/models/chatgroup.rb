class Chatgroup < ApplicationRecord
  validates :group_name, uniqueness: true, presence: true
  has_many :chatgroups, through: :chatgroup_users

end
