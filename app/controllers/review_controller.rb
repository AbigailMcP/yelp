class ReviewController < ApplicationController

  def new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(review_parameters)
    redirect_to "/restaurant/#{params[:restaurant_id]}/review"
  end

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews
  end

  private

  def review_parameters
    params[:review][:score] = params[:review][:score].to_i
    params[:review].permit(:score, :comment)
  end
end
