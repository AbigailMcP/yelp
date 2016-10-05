require 'spec_helper.rb'
require 'rails_helper.rb'

feature 'user can sign up' do

  scenario 'flashes goodbye message on log out' do
    visit '/users/sign_up'
    fill_in('user_email', with: 'jo@jo.com')
    fill_in('user_password', with: '123456')
    fill_in('user_password_confirmation', with: '123456')
    click_on('Sign up')
    click_on('Sign Out')
    expect(page).to have_content('Signed out successfully')
  end

  scenario 'flashes sign up message on sign in' do
    visit '/users/sign_up'
    fill_in('user_email', with: 'jo@jo.com')
    fill_in('user_password', with: '123456')
    fill_in('user_password_confirmation', with: '123456')
    click_on('Sign up')
    expect(page).to have_content('You have signed up successfully')
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
