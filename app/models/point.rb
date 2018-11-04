class Point < ApplicationRecord
  belongs_to :user
  belongs_to :meigen

  validates :value, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
