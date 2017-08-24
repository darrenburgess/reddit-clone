class CommentsController < ApplicationController
  before_action :require_user, only: [:create]
  before_action :set_categories, only: [:create]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.author = User.first # TODO: convert to logged in user

    if @comment.save
      flash[:notice] = "Your comment was created"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end
