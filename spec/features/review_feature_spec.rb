require 'rails_helper'
require "spec_helper"


  feature 'posting reviews' do
    before do
      signup
      create_restaurant
    end

    scenario 'they cannot review a specific restaurant' do
      visit '/restaurant/'
      click_link('Chicken shop')
      click_button('add review')
      fill_in('review_score', with: 5)
      fill_in('review_comment', with: "very chickeny")
      click_on('Save Review')
      expect(page).to have_content("You cannot review your own restaurant")
    end

    scenario 'reviewing a restaurant twice' do
      signout
      signup2
      visit '/restaurant/'
      click_link('Chicken shop')
      click_button('add review')
      fill_in('review_score', with: 5)
      fill_in('review_comment', with: "very chickeny")
      click_on('Save Review')
      visit '/restaurant/'
      click_link('Chicken shop')
      click_button('add review')
      fill_in('review_score', with: 5)
      fill_in('review_comment', with: "very chickeny")
      click_on('Save Review')
      expect(page).to have_content("You have already reviewed this restaurant")
    end
    scenario 'reviewing others restaurant' do
      signout
      signup2
      visit '/restaurant/'
      click_link('Chicken shop')
      click_button('add review')
      fill_in('review_score', with: 4)
      fill_in('review_comment', with: "very chickeny")
      click_on('Save Review')
      expect(page).to have_content("4/5 - very chickeny")
      visit '/restaurant/'
      click_link('Chicken shop')
      expect(page).to have_content("Average Rating - 4.0/5")
    end
end
