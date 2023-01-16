class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :require_user, except: [ :new, :create, :newworker]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:index]
  # GET /users or /users.json
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  # GET /users/1 or /users/1.json
  def show
    @all_orders = @user.orders.paginate(page: params[:page], per_page: 5)
    @orders = @user.orders.by_categories(current_user.categories).paginate(page: params[:page], per_page: 5)
    @average_rating = @user.ratings.average(:rating)
    @ratings = Rating.where(user_id: @user.id)
  end

  # GET /users/new
  def new
    @user = User.new
    
  end
  def newworker
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:error] = "Account and all associated orders successfully deleted"
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :address, :phone_number, :role, category_ids: [])
    end

    def require_same_user
      if current_user != @user and !current_user.admin?
        flash[:error] = "You can only edit or delete your own account"
        redirect_to root_path
      end
    end
    def require_admin
      if  !current_user.admin?
        flash[:error] = "YOU ARE NOT ADMIN"
        redirect_to root_path
      end
    end
end
