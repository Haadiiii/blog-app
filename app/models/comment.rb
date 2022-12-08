class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: :post_id
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  after_save :update_comment_counter

  def update_comment_counter_when_destroy
    post.decrement!(:comments_counter)
  end

  private

  def update_comment_counter
    post.increment!(:comments_counter)
  end
end
