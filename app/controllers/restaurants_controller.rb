class RestaurantsController < ApplicationController
  before_action :authorize_admin, only: [:destroy]

  def index
    @restaurant = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Restaurant.find(params[:id]).comments
  end

  def new
    @admin = current_admin
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.admin = current_admin
    if @restaurant.save
      redirect_to root_path, notice: "Le restaurant a été créé avec succès."
    else
      render :new
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.delete
    redirect_to root_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:restaurant_name)
  end

  def authorize_admin
    @restaurant = Restaurant.find(params[:id])
    unless current_admin == @restaurant.admin
      redirect_to root_path
    end
  end
end
