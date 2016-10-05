require 'rails_helper'
require "spec_helper"


  feature 'posting reviews' do
    before do
      signup
      create_restaurant
    end

    scenario 'they can review a specific restaurant' do
      visit '/restaurant/'
      click_link('Chicken shop')
      click_button('add review')
      fill_in('review_score', with: 5)
      fill_in('review_comment', with: "very chickeny")
      click_on('Save Review')
      expect(page).to have_content("5/5 - very chickeny")
      visit '/restaurant/'
      click_link('Chicken shop')
      click_button('add review')
      fill_in('review_score', with: 1)
      fill_in('review_comment', with: "bad chicken")
      click_on('Save Review')
      visit '/restaurant/'
      click_link('Chicken shop')
      expect(page).to have_content("Average Rating - 3.0/5")
    end
  end
