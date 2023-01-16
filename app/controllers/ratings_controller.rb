class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new]

  def new
    @rating = Rating.new
  end

  def create
    @user = User.find(params[:rating][:user_id])
    @rating = Rating.new(rating_params)
    if @rating.save
      redirect_to user_path(@rating.user), notice: 'Rating was successfully created.'
    else
      render :new
    end
  end

  def index
    @ratings = current_user.ratings
  end

  def destroy
    @rating.destroy
    redirect_to ratings_path, notice: 'Rating was successfully destroyed.'
  end

  private
    def set_rating
      @rating = Rating.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def rating_params
      params.require(:rating).permit(:user_id, :rater_id, :rating).merge(rater_id: current_user.id)
    end
end
