class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :set_categories, only: [:index, :edit, :new, :show]
  before_action :require_user, only: [:edit, :new, :create, :update]

  def index
    @posts = Post.all
  end

  def show
    @comment = @post.comments.new 
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = User.first # TODO: use logged in user

    if @post.save
      flash[:notice] = "Your post was created"
      redirect_to post_path @post
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @post.update(post_params)
      flash[:notice] = "Your post was updated"
      redirect_to post_path @post
    else
      render :edit
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:url, :title, :description, category_ids: [])
  end
end
