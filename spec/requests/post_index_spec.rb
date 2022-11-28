require 'rails_helper'

RSpec.feature 'PostIndex', type: :feature do
  it 'response body includes correct placeholder text' do
    visit posts_index_path
    expect(page).to have_content('Here is a list of posts for a given user')
  end

  it 'response status was correct.' do
    visit posts_index_path
    expect(page.status_code).to eq(200)
  end
end
