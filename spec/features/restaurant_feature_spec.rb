require 'spec_helper.rb'
require 'rails_helper.rb'

feature 'viewing restaurants' do

  scenario 'they see a list of restaurants' do
    visit '/restaurant'
    expect(page).to have_content('There are no restaurants')
  end

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
let(:shop) { Restaurant.create(name: "Chicken shop", description: "Great") }

  scenario 'can click through to individual restaurant page' do
    visit "/restaurant/#{shop.id}"
    expect(page).to have_content('Great')
  end

end

feature 'editing restaurant' do
  let(:shop) { Restaurant.create(name: "Chicken shop", description: "Great") }

  scenario 'can edit individual restaurant' do
    visit "/restaurant/#{shop.id}"
    click_on('edit')
    expect(page).to have_current_path("/restaurant/#{shop.id}/edit")
  end

  scenario('can save edits to database') do
    visit "/restaurant/#{shop.id}"
    click_on('edit')
    expect(page).to have_current_path("/restaurant/#{shop.id}/edit")
    fill_in("restaurant[name]", with: 'Sushi shop')
    click_on('save')
    expect(page).to have_current_path("/restaurant")
    expect(page).to have_content('Sushi shop')
  end

end

  feature 'deleting restaurant' do
    let(:shop) { Restaurant.create(name: "Chicken shop", description: "Great") }

    scenario 'can delete an individual restaurant' do
      visit "/restaurant/#{shop.id}"
      click_on('delete')
      expect(page).to have_current_path("/restaurant")
      expect(page).not_to have_content('Chicken shop')
    end
  end
