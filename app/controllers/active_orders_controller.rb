class ActiveOrdersController < ApplicationController

  def index
    @active_orders = ActiveOrder.where("user_id = ? OR worker_id = ?", current_user.id, current_user.id)
    @all_active_orders = ActiveOrder.paginate(page: params[:page], per_page: 5)
    end

  def show
    
  end

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
  
  private


  def active_order_params
    params.require(:active_order).permit(:status)
  end

    # Only allow a list of trusted parameters through.
    
end