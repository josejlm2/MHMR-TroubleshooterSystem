class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery
end

class AuthenticationController < ApplicationController
  # Turns off user authentication for all actions below
  skip_before_filter :authenticate_user!

  def login
    '...'
  end
end

class AdminController < ApplicationController
  before_filter :ensure_admin

  private

  def ensure_admin!
    unless current_user.admin?
      sign_out current_user

      redirect_to root_path

      return false
    end
  end
end
