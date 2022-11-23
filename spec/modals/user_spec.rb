require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'test', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'test', posts_counter: 2)
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post counter should be greater than 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'post counter should be greater than 0' do
    subject.posts_counter = 1
    expect(subject).to be_valid
  end

  it 'post counter should be an integer' do
    subject.posts_counter = 1.2
    expect(subject).to_not be_valid
  end
  # add tests for your custom methods here
  it 'should return the most recent posts' do
    user = User.create(name: 'test', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'test',
                       posts_counter: 2)
    post2 = Post.create(title: 'test', author_id: user.id, comments_counter: 2, likes_counter: 2)
    post3 = Post.create(title: 'test', author_id: user.id, comments_counter: 2, likes_counter: 2)
    post4 = Post.create(title: 'test', author_id: user.id, comments_counter: 2, likes_counter: 2)
    post5 = Post.create(title: 'test', author_id: user.id, comments_counter: 2, likes_counter: 2)
    post6 = Post.create(title: 'test', author_id: user.id, comments_counter: 2, likes_counter: 2)
    expect(user.most_recent_posts).to eq([post6, post5, post4, post3, post2])
  end
end
