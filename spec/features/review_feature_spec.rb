require 'rails_helper'
require "spec_helper"


  feature 'posting reviews' do
    before do
      signup
      create_restaurant
    end

    scenario 'they cannot review a specific restaurant' do
      write_review
      expect(page).to have_content("You cannot review your own restaurant")
    end

    scenario 'reviewing a restaurant twice' do
      signout
      signup2
      write_review
      write_review
      expect(page).to have_content("You have already reviewed this restaurant")
    end
    scenario 'reviewing others restaurant' do
      signout
      signup2
      write_review
      expect(page).to have_content("4/5 - very chickeny")
      visit '/restaurant/'
      click_link('Chicken shop')
      expect(page).to have_content("Average Rating - 4.0/5")
    end
    scenario 'deleting own comment' do
      signout
      signup2
      write_review
      visit '/restaurant/'
      click_link('Chicken shop')
      click_button('View reviews')
      click_button('Delete review')
      expect(page).not_to have_content("4/5 - very chickeny")
      expect(page).to have_content("Review successfully deleted")
    end

    scenario 'deleting others comment' do
      signout
      signup2
      write_review
      signout
      login
      visit '/restaurant/'
      click_link('Chicken shop')
      expect(page).not_to have_content("Delete review")
    end

end
