require 'rails_helper'

RSpec.describe "UserShows", type: :feature do
  it 'response body includes correct placeholder text' do
    visit user_path(1)
    expect(page).to have_content('See user profile')
  end

  it 'response status was correct.' do
    visit user_path(1)
    expect(page.status_code).to eq(200)
  end
end
