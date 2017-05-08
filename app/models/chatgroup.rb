class Chatgroup < ApplicationRecord
  validates :group_name, uniqueness: true, presence: true
end
