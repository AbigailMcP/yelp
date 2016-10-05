class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validates :score, numericality: {greater_than: 0, less_or_equal_to: 5}

  def self.add_review(user, restaurant, parameters)
    review = self.new(parameters)
    if user.id == restaurant.user_id
      review.errors.add(:review, "You cannot review your own restaurant")
    elsif Review.find_by(user_id: user.id)
      review.errors.add(:review, "You have already reviewed this restaurant")
    else
      restaurant.reviews << review
      user.reviews << review
      review.save
    end
    return review
  end

end
