class TicketsController < ApplicationController
@@Months=["January","February","March","April","May","June","July","August","September","October","November","December"]
  def index
        
	@tickets = Ticket.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
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
    if current_user.manager? or current_user.admin?
	@ticket = Ticket.find(params[:id])
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end	
  end
  def update
    if current_user.manager? or current_user.admin?
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
 def summary
    if current_user.manager? or current_user.admin?
	@Ticket_stats=[]
	(1..12).each do |i|
		@Ticket_stats.push([@@Months[i-1],Ticket.created_in_month(i).count , Ticket.closed_in_month(i).count,i] )
	end
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
 end
 def monthSummary
    if current_user.manager? or current_user.admin?
      @month =params[:id] 
      @LocationStats=[]
      @CategoryNames=Hash.new
      @Month = @@Months[@month.to_i]
      Location.all.each do |loc|
	  @TicketLocation=Ticket.location(loc.id)
	  created= @TicketLocation.created_in_month(@month)
	  closed=@TicketLocation.closed_in_month(@month)
	  @LocationStats.push([loc.name, created.count , closed.count ,storeHash(created),storeHash(closed)])
      end
      Category.all.each do |cat|
	  @CategoryNames[cat.id]=cat.name
      end
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
 end
 def storeHash(data)
    if current_user.manager? or current_user.admin?
	temp = Hash.new
	data.each do |ticket|
		if temp.has_key?(ticket.category_id)
			temp[ticket.category_id] +=1
		else
			temp[ticket.category_id]=1
		end
	end
	return temp
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end
end
