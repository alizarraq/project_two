class ActiveOrdersController < ApplicationController

  def index
    @active_orders = ActiveOrder.where("user_id = ? OR worker_id = ?", current_user.id, current_user.id)
    end

  def create

  end

end