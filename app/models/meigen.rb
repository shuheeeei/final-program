class Meigen < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader
  validates :content, presence: true

  def like_user(id)
    likes.find_by(user_id: id)
  end
end
