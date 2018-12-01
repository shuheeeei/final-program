class Meigen < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :points, dependent: :destroy

  mount_uploader :image, ImageUploader
  validates :content, presence: true, uniqueness: true
  validates :source, presence: true

  acts_as_taggable


  scope :contents, -> keyword do
    if keyword.present?
      Meigen.where("content LIKE(?)", "%" + keyword + "%")
    end
  end

  scope :sources, -> keyword do
    if keyword.present?
      Meigen.where("source LIKE(?)", "%" + keyword + "%")
    end
  end

  scope :tags, -> keyword do

      Meigen.joins(:tags).select("meigens.*, tags.name").where("name LIKE(?)", "%" + keyword + "%")

  end


  def like_user(id)
    likes.find_by(user_id: id)
  end
end
