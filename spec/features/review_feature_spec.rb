require 'rails_helper'
require "spec_helper"


  feature 'posting reviews' do
    before do
      Capybara.current_driver = :selenium
      visit '/restaurant/new'
      fill_in('name', with: 'Chicken shop')
      fill_in('description', with: 'ChickeneyChicken lol :)')
      click_on('add')
    end

    scenario 'they can review a specific restaurant', js: true  do
      visit '/restaurant/'
      click_button('View restaurant')
      click_button('Add Review')
      fill_in('review_score', with: 5)
      fill_in('review_comment', with: "very chickeny")
      click_on('Save Review')
      expect(page).to have_content("5/5 - very chickeny")
      visit '/restaurant/'
      click_button('View restaurant')
      click_button('Add Review')
      fill_in('review_score', with: 1)
      fill_in('review_comment', with: "bad chicken")
      click_on('Save Review')
      visit '/restaurant/'
      click_button('View restaurant')
      expect(page).to have_content("Average Rating - 3.0/5")
    end
  end
