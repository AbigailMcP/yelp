class RestaurantController < ApplicationController

   def index
     @restaurants = Restaurant.all
   end

   def new
   end

   def create
     @restaurant = Restaurant.create(restaurant_params)
     redirect_to action: "index"
   end

   def show
     @restaurant = Restaurant.find(params[:id])
   end

   def edit
   end

   def update
     redirect_to "/restaurant/1"
   end

   def destroy
     redirect_to action: "index"
   end

   private

   def restaurant_params
     params.permit(:name, :description)
   end
end
