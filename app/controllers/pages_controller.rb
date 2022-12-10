class PagesController < ApplicationController
  def home
    redirect_to orders_path if logged_in?
  end
end
