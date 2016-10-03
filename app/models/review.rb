class Review < ApplicationRecord
  belongs_to :restaurant
  validates :rating, numericality: {greater_than: 0, less_or_equal_to: 5}
end
