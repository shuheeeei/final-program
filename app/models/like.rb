class Like < ApplicationRecord
  belongs_to :meigen, counter_cache: :likes_count
  belongs_to :user
end
