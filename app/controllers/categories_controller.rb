class CategoriesController < ApplicationController
  def index
	@categories = Category.all
  end

  def show
  end

  def new
	@category =Category.new
  end
  def create
	@category = Category.new(category_params)
	if @category.save
		redirect_to(:action => 'index')
	else
		render('new')
	end
  end
  def edit
  end

  def delete
  end
end
