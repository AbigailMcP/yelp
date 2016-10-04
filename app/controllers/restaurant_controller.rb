class RestaurantController < ApplicationController

   def index
     @restaurants = Restaurant.all
     @scores = @restaurants.map(&:get_average_score)
     @restaurant_scores = @restaurants.zip(@scores)
   end

   def new
     @restaurant = Restaurant.new
   end

   def create
     @restaurant = Restaurant.create(restaurant_params_new)
     redirect_to action: "index"
   end

   def show
     @restaurant = Restaurant.find(params[:id])
     @score = @restaurant.get_average_score
   end

   def edit
     @restaurant = Restaurant.find(params[:id])
   end

   def update
     @restaurant = Restaurant.find(params[:id])
     @restaurant.update(restaurant_params)
     redirect_to '/restaurant'
   end

   def destroy
     @restaurant = Restaurant.find(params[:id])
     @restaurant.destroy
     redirect_to action: "index"
   end

   private

   def restaurant_params_new
     params.permit(:name, :description)
   end

   def restaurant_params
     params[:restaurant].permit(:name, :description)
   end
end
