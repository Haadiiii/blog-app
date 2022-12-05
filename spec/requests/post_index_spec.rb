require 'rails_helper'

RSpec.feature 'PostIndex', type: :feature do

  it 'response status was correct.' do
    visit posts_index_path
    expect(page.status_code).to eq(200)
  end
end
