class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def create
    @location = Location.new(params[:location])
     
    if @location.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def new
    @location = Location.new
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    
    if(@location.update_attributes(params[:location]))
      redirect_to locations_path(@location)
    else
      render('index')
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    redirect_to locations_path
  end
end
