class StatusesController < ApplicationController
 def index
	@statuses = Status.all
  end


  def index
	@status = Status.all
  end

  def show
	@status = Status.find(params[:id])
  end

  def new
	@status =Status.new
  end
  def create
	@status = Status.new(params[:status])
	if @status.save
		redirect_to(:action => 'index')
	else
		render('new')
	end
  end
  def edit
	@status = Status.find(params[:id])
  end
  def update
	@status = Status.find(params[:id])
	if @status.update_attributes(params[:status])
		redirect_to statuses_path(@status)
	else
		render('index')
	end
  end
  def delete
	@status = Status.find(params[:id])
  end
  def destroy
  	@status = Status.find(params[:id])
	@status.destroy
	redirect_to statuses_path
  end
end
