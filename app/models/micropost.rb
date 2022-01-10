class Micropost < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  mount_uploader :picture, PictureUploader

  default_scope -> { order(created_at: :desc) }
end
