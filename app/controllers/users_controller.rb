class UsersController < ApplicationController
  def index
    if current_user.admin?
      @users = User.order('email').all
    else
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
    end
  end

  def new
    if current_user.admin?
      @user = User.new
    else
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
    end
  end

  def create
    if current_user.admin?
      @user = User.new(params[:user])
      if @user.save
        flash[:notice] = "Successfully created User."
        redirect_to users_path
      else
        flash[:failure] = "Error. Try again."
        render :action => 'new'
      end
    else
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
    end
  end

  def show
    if current_user.admin?
      @user = User.find(params[:id])
    else
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
    end
  end

  def edit
    if current_user.admin?
      @user = User.find(params[:id])
    else
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
    end
  end

  def update
    if current_user.admin?
      @user = User.find(params[:id])
      params[:user].delete(:password) if params[:user][:password].blank?
      params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
      if @user.update_attributes(params[:user])
        flash[:notice] = "Successfully updated User."
        redirect_to users_path
      else
        render :action => 'edit'
      end
    else
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
    end
  end

  def delete
    if current_user.admin?
      @user = User.find(params[:id])
    else
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
    end
  end

  def destroy
    if current_user.admin?
      @user = User.find(params[:id])
      if @user.destroy
        flash[:notice] = "Successfully deleted User."
        redirect_to users_path
      end
    else
      flash[:failure] = "Permission Denied!"
      redirect_to root_path
    end
  end

end
