class TicketsController < ApplicationController
  def index
        
	@tickets = Ticket.paginate(:page => params[:page], :per_page => 10)
	respond_to do |format|
		format.html
		format.json { render json: @tickets }
	end
  end       
  

  def select
	@ticket = Ticket.find(params[:id])
        @status = Ticket.status
  end


  def show
	@ticket = Ticket.find(params[:id])
  end

  def new
	@ticket =Ticket.new
  end
  def create
	@ticket = Ticket.new(params[:ticket])
	if @ticket.save
		redirect_to(:action => 'index')
	else
		render('new')
	end
  end

  def edit
    if current_user.admin?
	@ticket = Ticket.find(params[:id])
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end	
  end
  def update
    if current_user.admin?
	@ticket = Ticket.find(params[:id])
	if @ticket.update_attributes(params[:ticket])
		redirect_to tickets_path
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
	@ticket = Ticket.find(params[:id])
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def destroy
    if current_user.admin?
  	@ticket = Ticket.find(params[:id])
	@ticket.destroy
	redirect_to tickets_path
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
end
