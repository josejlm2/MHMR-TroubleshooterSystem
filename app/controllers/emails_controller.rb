class EmailsController < ApplicationController
  def index
    if current_user.admin?
	@emails = Email.all
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end 
  end
  def show
    if current_user.admin?
       @email = Email.find(params[:id])
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def new
    if current_user.admin?
	@email = Email.new
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def create
    if current_user.admin?
	@email = Email.new(params[:email])
	if @email.save
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
	@email = Email.find(params[:id])
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def update
    if current_user.admin?
	@email = Email.find(params[:id])
	if @email.update_attributes(params[:email])
		redirect_to emails_path(@email)
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
	@email = Email.find(params[:id])
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def destroy
    if current_user.admin?
	@email = Email.find(params[:id])
	@email.destroy
	redirect_to emails_path
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
end
