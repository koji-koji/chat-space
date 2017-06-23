class Comment < ApplicationRecord
  validates :comment, presence: true, if: :image_upload?
  validates :chatgroup_id, presence: true
  validates :user_id, presence: true
  belongs_to :user
  belongs_to :chatgroup
  mount_uploader :image, ImageUploader

  def image_upload?
    image.file == nil
  end

end
