require 'rails_helper'

RSpec.describe 'PostShow', type: :feature do

  it 'response status was correct.' do
    visit user_post_path(1, 1)
    expect(page.status_code).to eq(200)
  end
end
