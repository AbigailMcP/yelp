require 'spec_helper.rb'
require 'rails_helper.rb'

feature 'signup' do
  before(:each) do
    signup
    create_restaurant
  end

  feature 'adding restaurants' do

    scenario 'user can add a new restaurant' do
      visit '/restaurant/new'
      expect(page).to have_content('Add a restaurant')
    end

  end

  feature 'creating restaurants' do

    scenario 'restaurants are saved to the database' do
      visit '/restaurant/new'
      fill_in('name', with: 'Chicken shop')
      click_on('add')
      expect(page).to have_current_path('/restaurant')
      expect(page).to have_content('Chicken shop')
    end

  end

  feature 'showing single restaurant' do

    scenario 'can click through to individual restaurant page' do
      visit "/restaurant"
      click_link("Chicken shop")
      expect(page).to have_content('Great')
      expect(page).to have_css("img[src*='image_missing.png']")
    end

  end

  feature 'editing restaurant' do

    scenario('can save edits to database') do
      visit "/restaurant"
      click_link("Chicken shop")
      click_on('edit')
      fill_in("restaurant[name]", with: 'Sushi shop')
      click_on('save')
      expect(page).to have_current_path("/restaurant")
      expect(page).to have_content('Sushi shop')
    end

  end

  feature 'deleting restaurant' do

    scenario 'can delete an individual restaurant' do
      visit "/restaurant"
      click_link("Chicken shop")
      click_on('delete')
      expect(page).to have_current_path("/restaurant")
      expect(page).not_to have_content('Chicken shop')
    end
  end
end
