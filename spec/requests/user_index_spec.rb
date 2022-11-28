require 'rails_helper'

RSpec.describe "UserIndixes", type: :feature do
  it 'response body includes correct placeholder text' do
    visit users_index_path
    expect(page).to have_content('Welcome to Blog App')
  end

  it 'response status was correct.' do
    visit users_index_path
    expect(page.status_code).to eq(200)
  end
end
