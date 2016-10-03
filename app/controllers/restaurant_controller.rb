class RestaurantController < ApplicationController
   def index

   end

   def new

   end

   def create
     redirect_to action: "index"
   end

   def show
   end

   def edit
   end

   def update
     redirect_to "/restaurant/1"
   end

   def destroy
     redirect_to action: "index"
   end
end
