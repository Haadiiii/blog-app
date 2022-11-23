require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:author) { User.create(name: 'test', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'test', posts_counter: 2) }

  subject do
    Post.new(title: 'test', author_id: author.id, comments_counter: 2, likes_counter: 2)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a author_id' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a comments_counter' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a likes_counter' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a title longer than 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'is not valid with a comments_counter not being an integer' do
    subject.comments_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'is not valid with a comments_counter being less than 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'is not valid with a likes_counter not being an integer' do
    subject.likes_counter = 'a'
    expect(subject).to_not be_valid
  end
end
