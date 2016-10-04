require 'rails_helper'

describe Restaurant, '#get_average_score' do

  before do
    @review = double(:review, score: 3)
    @reviews = double(:reviews, to_ary: [@review, @review])
    @restaurant = described_class.new
    allow(@restaurant).to receive(:reviews).and_return(@reviews)
  end

  it 'averages associated scores' do
    expect(@restaurant.get_average_score).to eq(3.0)
  end

end
