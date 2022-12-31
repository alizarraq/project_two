class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :require_worker_admin, only: [:index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # GET /orders or /orders.json
  def index
    @orders = Order.by_categories(current_user.categories).paginate(page: params[:page], per_page: 5)
    @all_orders = Order.paginate(page: params[:page], per_page: 5)
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:title, :descreption, :price, :location, category_ids: [], images: [])
    end
    def require_same_user
      if current_user != @order.user and !current_user.admin?
        flash[:danger] = "You can only edit or delete your own order"
        redirect_to root_path
      end
    end
    def require_worker_admin
      if !logged_in? &&(!current_user.worker?  || !current_user.admin?)
        flash[:danger] = "you are not allowed to see all orders"
        redirect_to root_path
      end
    end
end
