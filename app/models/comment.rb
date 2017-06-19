class Comment < ApplicationRecord
  validates :comment,presence: true ,if: :image_upload?
  belongs_to :user
  belongs_to :chatgroup
  mount_uploader :image, ImageUploader

  def image_upload?
    :image == nil
  end
end
