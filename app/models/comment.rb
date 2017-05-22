class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :chatgroup
  mount_uploader :image, ImageUploader
end
