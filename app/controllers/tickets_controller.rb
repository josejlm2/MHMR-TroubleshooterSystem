class TicketsController < ApplicationController
  def index
	@tickets = Ticket.all
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
	@ticket = Ticket.find(params[:id])
  end
  def update
	@ticket = Ticket.find(params[:id])
	if @ticket.update_attributes(params[:ticket])
		redirect_to tickets_path(@ticket)
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
end
