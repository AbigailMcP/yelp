class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validates :score, numericality: {greater_than: 0, less_or_equal_to: 5}
end
