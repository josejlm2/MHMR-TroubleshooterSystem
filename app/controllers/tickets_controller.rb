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
                ConfirmationMailer.confirmation_email(@ticket).deliver
		NotificationMailer.notification_email(@ticket)
		redirect_to(:action => 'index')
	else
		render('new')
	end
  end

  def edit
	@ticket = Ticket.find(params[:id])
	
  end
  def update
	@ticket = Ticket.find(params[:id])
	if @ticket.update_attributes(params[:ticket])
		redirect_to tickets_path
	else
		render('index')
	end
  end
  def delete
	@ticket = Ticket.find(params[:id])
  end
  def destroy
  	@ticket = Ticket.find(params[:id])
	@ticket.destroy
	redirect_to tickets_path
  end
 def summary
	#find all tickets closed
	#Ticket.where("status  = closed")
	@tickets = Ticket.all	
 end
 def findByRange
	#Date.strptime("12/13/2013", "%m/%d/%Y")	
	@tickets =Ticket.where("created_at >= :start_date AND created_at <= :end_date",
	  {start_date: params[:start_date], end_date: params[:end_date]})
	redirect_to summary_tickets_path
 end
end
