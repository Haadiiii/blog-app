require 'rails_helper'

RSpec.describe 'PostShow', type: :feature do
  it 'response body includes correct placeholder text' do
    visit user_post_path(1, 1)
    expect(page).to have_content('posts for a given user')
  end

  it 'response status was correct.' do
    visit user_post_path(1, 1)
    expect(page.status_code).to eq(200)
  end
end
