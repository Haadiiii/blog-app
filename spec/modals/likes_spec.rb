require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:author) { User.create(name: 'test', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'test', posts_counter: 2) }
  let(:post) { Post.create(title: 'test', author_id: author.id, comments_counter: 2, likes_counter: 2) }

  subject do
    Like.new(author_id: author.id, post_id: post.id)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a author_id' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a post_id' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a post_id not being an integer' do
    subject.post_id = 'a'
    expect(subject).to_not be_valid
  end

  it 'is not valid with a post_id being less than 0' do
    subject.post_id = -1
    expect(subject).to_not be_valid
  end

  it 'is not valid with a author_id not being an integer' do
    subject.author_id = 'a'
    expect(subject).to_not be_valid
  end

  it 'is not valid with a author_id being less than 0' do
    subject.author_id = -1
    expect(subject).to_not be_valid
  end

  # add tests for your custom methods here
  it 'should update the likes_counter of a post' do
    Like.create(author_id: author.id, post_id: post.id)
    expect(post.likes_counter).to eq(2)
  end
end
