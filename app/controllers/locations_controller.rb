class LocationsController < ApplicationController
  def index
    if current_user.admin?
      @locations = Location.all
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end

  def create
    if current_user.admin?
      @location = Location.new(params[:location])
     
      if @location.save
        redirect_to(:action => 'index')
      else
        render('new')
      end
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end

  def new
    if current_user.admin?
      @location = Location.new
	#@location.tickets.build
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end

  def edit
    if current_user.admin?
      @location = Location.find(params[:id])
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end

  def update
    if current_user.admin?
      @location = Location.find(params[:id])
      
      if(@location.update_attributes(params[:location]))
        redirect_to locations_path(@location)
      else
        render('index')
      end
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end

  def destroy
    if current_user.admin?
      @location = Location.find(params[:id])
      @location.destroy

      redirect_to locations_path
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end

  def deleted
    if current_user.admin?
      @locations = Location.only_deleted
      render('index')
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end

  def restore
    if current_user.admin?
      Location.restore(params[:id])
      redirect_to deleted_locations_path
    else
      flash[:notice] = "Permission Denied!"
      redirect_to root_path
    end
  end

end
