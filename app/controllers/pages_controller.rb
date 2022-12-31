class PagesController < ApplicationController
  def home
    if logged_in? && current_user.user?
      redirect_to user_path(current_user)
    elsif logged_in? && (current_user.admin? || current_user.worker?)
      redirect_to orders_path
    end
  end
end
