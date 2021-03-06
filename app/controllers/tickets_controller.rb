class TicketsController < ApplicationController
@@Months=["January","February","March","April","May","June","July","August","September","October","November","December"]
  def index

        @tickets = Ticket.paginate(:page => params[:page], :per_page => 10).order('created_at desc').where("status_id != ?", Status.find_by_name("Closed").id)
	@whichStatus = "All Except Closed"        

        if(params[:status] == 'all')
            @tickets = Ticket.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
            @whichStatus = "All"
        elsif(params[:status])
            @tickets = Ticket.paginate(:page => params[:page], :per_page => 10).order('created_at desc').where("status_id = ?", Status.find_by_name(params[:status]).id)
            @whichStatus = params[:status]
        end

        @statuses = Status.all
	
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
    if current_user.admin? or current_user.manager?
	@ticket = Ticket.find(params[:id])
    else
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
    end	
  end
  def update
    if current_user.admin? or current_user.manager?
	@ticket = Ticket.find(params[:id])
	if @ticket.update_attributes(params[:ticket])
		redirect_to tickets_path
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
	@ticket = Ticket.find(params[:id])
    else
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def destroy
    if current_user.admin?
  	@ticket = Ticket.find(params[:id])
	@ticket.destroy
	redirect_to tickets_path
    else
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
    end
  end
 def summary
    if current_user.admin? or current_user.manager?
	@Ticket_stats=[]
    	@year=params.has_key?(:data) ? params[:data][:id] : Date.today.year
	@year= Integer(@year) rescue Date.today.year
	(1..12).each do |i|
		@Ticket_stats.push([@@Months[i-1],Ticket.created_in_month(i,@year).count , Ticket.closed_in_month(i,@year).count,i] )
	end
    else
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
   end
 end
 def monthSummary
   if current_user.admin? or current_user.manager?
    @month =params[:month]
    @year = params[:year] 
    @LocationStats=[]
    @CategoryNames=Hash.new
    @Month = @@Months[@month.to_i]
    Location.all.each do |loc|
	@TicketLocation=Ticket.location(loc.id)
	created= @TicketLocation.created_in_month(@month,@year)
	closed=@TicketLocation.closed_in_month(@month,@year)
	@LocationStats.push([loc.name, created.count , closed.count ,storeHash(created),storeHash(closed)])
    end
    Category.all.each do |cat|
	@CategoryNames[cat.id]=cat.name
    end
  else
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
  end
 end
 def storeHash(data)
	temp = Hash.new
	data.each do |ticket|
		if temp.has_key?(ticket.category_id)
			temp[ticket.category_id] +=1
		else
			temp[ticket.category_id]=1
		end
	end
	return temp
 end
end

