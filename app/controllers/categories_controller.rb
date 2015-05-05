class CategoriesController < ApplicationController
  def index
    if current_user.admin?
	@categories = Category.order('name').all
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def show
    if current_user.admin?
	@category = Category.find(params[:id])
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end

  def new
    if current_user.admin?
	@category =Category.new
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def create
    if current_user.admin?
	@category = Category.new(params[:category])
	if @category.save
		redirect_to(:action => 'index')
	else
		render('new')
	end
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def edit
    if current_user.admin?
	@category = Category.find(params[:id])
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def update
    if current_user.admin?
	@category = Category.find(params[:id])
	if @category.update_attributes(params[:category])
		redirect_to categories_path(@category)
	else
		render('index')
	end
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def delete
    if current_user.admin?
	@category = Category.find(params[:id])
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def destroy
    if current_user.admin?
  	@category = Category.find(params[:id])
	@category.destroy
	redirect_to categories_path
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def deleted
    if current_user.admin?
      @categories = Category.only_deleted
      render('index')
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def restore
    if current_user.admin?
      Category.restore(params[:id])
      redirect_to deleted_categories_path
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
end
