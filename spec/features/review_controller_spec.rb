require 'rails_helper'



  feature 'posting reviews' do

    scenario 'they can review a specific restaurant' do
      visit '/restaurant/1/review/new'
      expect(page).to have_content('Add review')
    end

  end

  feature 'saving reviews' do

    scenario 'they can save a specific restaurant' do
      visit '/restaurant/1/review/new'
      fill_in('score', with: 5)
      fill_in('comment', with: "very bad")
      click_on('add review')
      expect(page).to have_current_path('/restaurant/1/review')
    end
  end

    feature 'viewing reviews' do

      scenario 'they can review a specific restaurant review' do
        visit '/restaurant/1/review'
        expect(page).to have_content('restaurant reviews')
      end
    end
