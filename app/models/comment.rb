class Comment < ApplicationRecord
  validates :comment,presence: true
  belongs_to :user
  belongs_to :chatgroup
  mount_uploader :image, ImageUploader
end
