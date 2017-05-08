class Chatgroup < ApplicationRecord
  validates :group_name, uniqueness: true
  validates :group_name, presence: true
end
