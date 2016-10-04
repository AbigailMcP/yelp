class Restaurant < ApplicationRecord
  has_many :reviews
  validates :name, presence: true

  def get_average_score
    reviews = self.reviews.to_ary
    score = reviews.map(&:score).inject{ |sum, el| sum + el }.to_f / reviews.size
    reviews.empty? ? 0 : score.round(1)
  end

end
