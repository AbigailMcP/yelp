class Restaurant < ApplicationRecord
  has_many :reviews
  belongs_to :user
  validates :name, presence: true
  validates :address, presence: true


  def get_average_score
    reviews = self.reviews.to_ary
    score = reviews.map(&:score).inject{ |sum, el| sum + el }.to_f / reviews.size
    reviews.empty? ? 0 : score.round(1)
  end

  geocoded_by :address
  geocoded_by :full_address

  after_validation :geocode

  def full_address
    "#{address}, #{zipcode}, #{city}, #{country}"
  end
end
