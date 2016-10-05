require 'spec_helper.rb'
require 'rails_helper.rb'

feature 'user can sign up' do

  scenario 'flashes goodbye message on log out' do
    signup
    signout
    expect(page).to have_content('Signed out successfully')
  end

  scenario 'flashes sign up message on sign in' do
    signup
    expect(page).to have_content('You have signed up successfully')
  end

  scenario 'log out button only shows when user is signed in' do
    signup
    signout
    expect(page).not_to have_button('Sign Out')
  end

  scenario 'sign up button only shows when there is no current user' do
    signup
    expect(page).not_to have_content('Sign up')
  end

end
#
# scenario 'user is taken to sign up page' do
#   visit '/restaurant'
#   click_on('Sign up')
#   expect(page).to have_current_path('/sign_up')
#   expect(page).to have_content('Please sign up')
# end
#
#   scenario 'user signs up and is taken to welcome page' do
#     visit '/sign_up'
#     fill_in('email', with: 'jo@jo.com')
#     fill_in('password', with: '123')
#     click_on('Sign up!')
#     expect(page).to have_current_path('/user')
#     expect(page).to have_content('Welcome jo@jo.com')
#   end
# end
