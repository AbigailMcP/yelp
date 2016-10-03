require 'spec_helper.rb'
require 'rails_helper.rb'

feature 'visiting home page' do

  scenario 'they see the home page' do
    visit '/'
    expect(page).to have_content('welcome')
  end

end
