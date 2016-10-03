require 'spec_helper.rb'
require 'rails_helper.rb'

feature 'viewing restaurants' do
  scenario 'they see the home page' do
    visit '/'
    expect(page).to have_content('welcome')
  end
end
