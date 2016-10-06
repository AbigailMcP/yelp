class Restaurant < ApplicationRecord
  has_many :reviews
  belongs_to :user
  validates :name, presence: true
  geocoded_by :address
  after_validation :geocode
  has_attached_file :image, styles: {medium: "300x300>", thumb: "100x100>" }, default_url: "/images/image_missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def get_average_score
    reviews = self.reviews.to_ary
    score = reviews.map(&:score).inject{ |sum, el| sum + el }.to_f / reviews.size
    reviews.empty? ? "Unreviewed" : score.round(1)
  end

end
