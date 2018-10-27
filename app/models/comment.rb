class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :meigen, counter_cache: :comments_count
  validates :content, presence: true
end
