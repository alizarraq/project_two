class ApplicationController < ActionController::Base
include UsersHelper
def require_user
  if !logged_in?
    flash[:danger] = "You must be logged in to perform that action"
    redirect_to root_path
  end
end
end
