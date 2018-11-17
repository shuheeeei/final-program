class Meigen < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :points, dependent: :destroy

  mount_uploader :image, ImageUploader
  validates :content, presence: true, uniqueness: true
  validates :source, uniqueness: true

  acts_as_taggable


  scope :contents_sources, -> keyword do
    if keyword.present?
      Meigen.where("content LIKE(?)", "%" + keyword + "%").or(Meigen.where("source LIKE(?)", "%" + keyword + "%"))
    end
  end

  scope :tags, -> keyword do
    if keyword.present?
      Meigen.where("name LIKE(?)", "%" + keyword + "%")
    end
  end


  def like_user(id)
    likes.find_by(user_id: id)
  end
end
