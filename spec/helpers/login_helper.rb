require 'rails_helper'

def login
  visit('/users/sign_in')
  fill_in("email", with: 'er@ce.com')
  fill_in("password", with: '123456')
  click_on('Log in')
end

def signup
  visit('/users/sign_up')
  fill_in("user_email", with: 'er@ce.com')
  fill_in("user_password", with: '123456')
  fill_in("user_password_confirmation", with: '123456')
  click_on('Sign up!')
end

def create_restaurant
  visit '/restaurant/new'
  fill_in('name', with: 'Chicken shop')
  fill_in('description', with: 'Great')
  click_on('add')
end
