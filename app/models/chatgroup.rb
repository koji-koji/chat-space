class Chatgroup < ApplicationRecord
 validates_presence_of :group_name
 validates :group_name, uniqueness: true
end
