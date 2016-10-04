require 'rails_helper'



  feature 'posting reviews' do
    before(:all) do
      Capybara.current_driver = :selenium
    end

    before do
      visit '/restaurant/new'
      fill_in('name', with: 'Chicken shop')
      fill_in('description', with: 'ChickeneyChicken lol :)')
      click_on('add')
    end

    scenario 'they can review a specific restaurant', js: true  do
      visit '/restaurant/1'
      click_button('Add Review')
      fill_in('score', with: 5)
      fill_in('comment', with: "very chickeny")
      click_on('add review')
      expect(page).to have_current_path('/restaurant/1/review')
      expect(page).to have_content("5/5 - very chickeny")
    end
  end

    feature 'viewing reviews' do

      scenario 'they can review a specific restaurant review' do
        visit '/restaurant/1/review'
        expect(page).to have_content('restaurant reviews')
      end
    end
