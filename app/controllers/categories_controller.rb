class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  before_action :set_categories, only: [:index, :show, :edit, :new, :create]
  before_action :require_user, only: [:edit, :new, :create, :update]

  def index
  end

  def show
    @posts = @category.posts 
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "New category created"
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category Updated"
      redirect_to categories_path
    else
      render :edit
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
