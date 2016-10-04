class Restaurant < ApplicationRecord
  has_many :reviews
  validates :name, presence: true

  def get_average_score
    reviews = self.reviews.to_ary
    reviews.empty? ? 0 : reviews.map(&:score).inject{ |sum, el| sum + el }.to_f / reviews.size
  end
end
