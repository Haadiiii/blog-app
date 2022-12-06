require "rails_helper"

RSpec.describe "UserShows", type: :system do
  subject { User.new(name: 'John', posts_counter: 30, photo: 'https://randomuser.me/api/portraits/men/70.jpg', bio: 'Teacher from Poland.') }

  before { subject.save }

  describe 'index page' do
    it 'I can see the username of all other users.' do
      visit root_path(subject)
      page.has_content?(subject.name)
    end

    it 'I can see the profile picture for each user.' do
      visit root_path(subject)
      page.has_css?('.img-fluid')
    end

    it 'I can see the number of posts each user has written.' do
      visit root_path(subject)
      page.has_content?(subject.posts_counter)
    end

    it "When I click on a user, I am redirected to that user's show page." do
      User.delete_all
      user = User.create(name: 'John', posts_counter: 30, photo: 'https://randomuser.me/api/portraits/men/70.jpg',
                         bio: 'Teacher from Poland.')
      visit root_path(user)
      click_on 'John'
      visit user_path(user.id)
      page.has_content?('John')
    end
  end

end
