require 'rails_helper'

def login
  visit('/users/sign_in')
  fill_in("user_email", with: 'er@ce.com')
  fill_in("user_password", with: '123456')
  click_on('Log in')
end

def signout
  click_button("Sign Out")
end

def signup
  visit('/users/sign_up')
  fill_in("user_email", with: 'er@ce.com')
  fill_in("user_password", with: '123456')
  fill_in("user_password_confirmation", with: '123456')
  click_on('Sign up!')
end

def signup2
  visit('/users/sign_up')
  fill_in("user_email", with: 'ts@ts.com')
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

def write_review
  visit '/restaurant/'
  click_link('Chicken shop')
  click_button('add review')
  fill_in('review_score', with: 4)
  fill_in('review_comment', with: "very chickeny")
  click_on('Save Review')
end
