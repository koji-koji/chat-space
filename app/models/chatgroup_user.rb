class ChatgroupUser < ApplicationRecord
  belongs_to :chatgroup
  belongs_to :user
end
