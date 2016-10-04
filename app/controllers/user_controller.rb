class UserController < ApplicationController

  def index
    @user = User.all
  end

  def sign_up
  end

  def create
    @user = User.create(user_params)
    redirect_to action: "index"
  end

  private

  def user_params
    params.permit(:email, :password)
  end

end
