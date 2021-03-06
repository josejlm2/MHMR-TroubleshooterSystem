class EmailsController < ApplicationController
  def index
    if current_user.admin?
	@emails = Email.order('email_address').all
    else
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
    end 
  end
  def show
    if current_user.admin?
       @email = Email.find(params[:id])
    else
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def new
    if current_user.admin?
	@email = Email.new
    else
      flash[:failure] = "Permission Denied!"
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
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def edit
    if current_user.admin?
	@email = Email.find(params[:id])
    else
      flash[:failure] = "Permission Denied!"
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
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
    end
  end

  def delete
    if current_user.admin?
	@email = Email.find(params[:id])
    else
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def destroy
    if current_user.admin?
	@email = Email.find(params[:id])
	@email.destroy
	redirect_to emails_path
    else
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def deleted
    if current_user.admin?
      @emails = Email.only_deleted
      render('deleted')
    else
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def restore
    if current_user.admin?
      Email.restore(params[:id])
      redirect_to deleted_emails_path
    else
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
    end
  end
end
