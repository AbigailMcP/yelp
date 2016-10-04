class ReviewController < ApplicationController

  def new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(score: 2, comment: "good")
    p @review.errors.messages
    redirect_to "/restaurant/#{params[:restaurant_id]}"
  end

  def index
  end

  private

  def review_parameters
    params.permit(:review)
  end
end
