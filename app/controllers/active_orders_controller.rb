class ActiveOrdersController < ApplicationController
  before_action :set_active_order, only: %i[ show  ]
  def index
    @active_orders = ActiveOrder.where("user_id = ? OR worker_id = ?", current_user.id, current_user.id)
    @all_active_orders = ActiveOrder.paginate(page: params[:page], per_page: 5)
    end

  def show
  end
  
    # Use callbacks to share common setup or constraints between actions.

  def edit
  end

  def update
    @active_order = ActiveOrder.find(params[:id])
    if @active_order.update(active_order_params)
      redirect_to @active_order, notice: 'Active order was successfully updated.'
    else
      render :edit
    end
  end
  # def finish
  #   @active_order = ActiveOrder.find(params[:id])
  #   @active_order.status = "finished"
  #   @active_order.save
  #   render partial: "ratings/rating_form"
  # end
  
  private
  
  def set_active_order
    @active_order = ActiveOrder.find(params[:id])
  end

  def active_order_params
    params.require(:active_order).permit(:status)
  end

    # Only allow a list of trusted parameters through.
    
end