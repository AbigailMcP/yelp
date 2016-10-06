class Restaurant < ApplicationRecord
  has_many :reviews
  belongs_to :user
  validates :name, presence: true
  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def get_average_score
    reviews = self.reviews.to_ary
    score = reviews.map(&:score).inject{ |sum, el| sum + el }.to_f / reviews.size
    reviews.empty? ? 0 : score.round(1)
  end


end
