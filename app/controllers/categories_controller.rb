class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update]

  def index
    @categories = Category.all
  end

  def new
  end

  def create
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
