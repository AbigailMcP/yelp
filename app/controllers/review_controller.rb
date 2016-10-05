class ReviewController < ApplicationController

  def new
  end

  def create
    if user_signed_in?
      @user = User.find(current_user.id)
      @restaurant = Restaurant.find(params[:restaurant_id])
      review = Review.add_review(@user, @restaurant, review_parameters)
      flash[:alert] = review.errors[:review]
      redirect_to "/restaurant/#{params[:restaurant_id]}/review"
    else
      redirect_to "index"
    end
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
