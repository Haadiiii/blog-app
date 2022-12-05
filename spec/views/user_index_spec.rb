require "rails_helper"

RSpec.describe "UserIndex", type: :feature do

    it "response status was correct." do
        visit users_index_path
        sleep(6)
        expect(page.status_code).to eq(200)
    end

    # I can see the username of all other users.
    it "can see the username of all other users" do
        visit users_index_path
        expect(page).to have_content("User")
    end

    # I can see the profile picture for each user.
    # it "can see the profile picture for each user" do
    #     visit users_index_path
    #     expect(page).to have_css("img[src*='']")
    # end

    # I can see the total number of posts each user has written.
    it "can see the total number of posts each user has written" do
        visit user_posts_path(post_id: 1)
        expect(page).to have_content("Posts")
    end

    # I can see the user who wrote the most posts.
    # it "can see the user who wrote the most posts" do
    #     visit users_path
    #     expect(page).to have_content("Most Posts")
    # end

    # When I click on a user, I am redirected to that user's show page.
    it "redirected to that user's show page" do
        visit users_index_path(1)
        click_link(user)
        expect(page).to have_current_path(user_path(1))
    end
end