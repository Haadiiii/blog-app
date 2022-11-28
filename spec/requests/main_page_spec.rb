require 'rails_helper'

RSpec.feature 'MainPage', type: :feature do
  it 'should display the root path' do
    visit root_path
    expect(page).to have_content('Welcome to Blog App')
  end

  it 'should display the correct status code' do
    visit root_path
    expect(page.status_code).to eq(200)
  end
end
