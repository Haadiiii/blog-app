require 'rails_helper'

RSpec.describe "UserShows", type: :feature do
  it 'response status was correct.' do
    visit users_index_path(id: 1)
    expect(page.status_code).to eq(200)
  end
end
