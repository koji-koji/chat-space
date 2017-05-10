class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :chatgroup
end
