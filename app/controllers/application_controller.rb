class ApplicationController < ActionController::Base
  add_flash_types :danger, :info, :warning, :success, :messages
  include UsersHelper
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
