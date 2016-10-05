class ReviewController < ApplicationController

  def new
  end

  def create
    if user_signed_in?
      # Find the User, find the restaurant to make review
      @user = User.find(current_user.id)
      @restaurant = Restaurant.find(params[:restaurant_id])
      # make a new ruby object
      @review = @restaurant.reviews.new(review_parameters)
      #add the review to it's associated user
      @user.reviews << @review
      # finally save the review with it's ass. restaurant and user
      @review.save
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
