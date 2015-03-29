class CategoriesController < ApplicationController
  def index
	@categories = Category.all
  end

  def show
	@category = Category.find(params[:id])
  end

  def new
	@category =Category.new
  end
  def create
	@category = Category.new(params[:category])
	if @category.save
		redirect_to(:action => 'index')
	else
		render('new')
	end
  end
  def edit
	@category = Category.find(params[:id])
  end
  def update
	@category = Category.find(params[:id])
	if @category.update_attributes(params[:category])
		redirect_to categories_path(@category)
	else
		render('index')
	end
  end
  def delete
  end
end
