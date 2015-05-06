class StatusesController < ApplicationController
 def index
    if current_user.admin?
	@statuses = Status.order('id').all
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end


  def index
    if current_user.admin?
	@status = Status.order('id').all
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end

  def show
    if current_user.admin?
	@status = Status.find(params[:id])
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end

  def new
    if current_user.admin?
	@status =Status.new
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def create
    if current_user.admin?
	@status = Status.new(params[:status])
	if @status.save
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
	@status = Status.find(params[:id])
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def update
    if current_user.admin?
	@status = Status.find(params[:id])
	if @status.update_attributes(params[:status])
		redirect_to statuses_path(@statuses)
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
	@status = Status.find(params[:id])
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def destroy
    if current_user.admin?
  	@status = Status.find(params[:id])
	@status.destroy
	redirect_to statuses_path
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def deleted
    if current_user.admin?
      @status = Status.only_deleted
      render('deleted')
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def restore
    if current_user.admin?
      Status.restore(params[:id])
      redirect_to deleted_statuses_path
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
end
