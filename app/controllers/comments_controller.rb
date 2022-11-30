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
      flash[:success] = 'New comment saved successfully'
      redirect_to "/users/#{@current_post.author.id}/posts/#{@current_post.id}"

    else
      flash[:error] = 'Something went wrong'
      render :new, status: :unprocessable_entity
    end
  end

  def comment_params
    params.permit(:text)
  end
end
