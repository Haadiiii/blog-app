class CommentsController < ApplicationController
  def new
    @comments = Comment.new
  end

  def create
    @current_post = Post.find(params[:post_id])
    @comments = @current_post.comments.new(comment_params)
    @comments.post_id = @current_post.id
    @comments.author_id = current_user.id
    if @comments.save
      redirect_to user_posts_path(@current_post.author_id, @current_post.id), notice: 'New comment saved successfully'

    else
      render :new, status: :unprocessable_entity, alert: 'Something went wrong'
    end
  end

  private

  def comment_params
    params.permit(:text)
  end
end
