require 'rails_helper'

RSpec.describe 'PostIndex', type: :feature do
  it 'response status was correct.' do
    visit root_path
    expect(page.status_code).to eq(200)
  end
end
