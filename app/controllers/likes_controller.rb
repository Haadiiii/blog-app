class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @current_post = Post.find(params[:post_id])
    @like = @current_post.likes.new
    @like.post_id = @current_post.id
    @like.author_id = current_user.id
    if @like.save
      flash[:success] = 'New like saved successfully'
      redirect_to user_post_path(current_user, @current_post)
    else
      flash[:error] = 'Something went wrong'
      render :new, status: :unprocessable_entity
    end
  end

  def like_params
    params.permit(:text)
  end
end
