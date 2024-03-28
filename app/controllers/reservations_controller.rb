class ReservationsController < ApplicationController
  def index
    @reservations = Reservations.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build
  end
  
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to @restaurant, notice: 'La réservation a été prise en compte.'
    else
      render 'restaurants/show'
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    if @reservation.delete
      flash[:notice] = "La réservation a été supprimée"
    end
  end

  private

  def require_login
    unless current_user
      redirect_to new_user_session_path
    end
  end

  def reservation_params
    params.require(:reservation).permit(:number, :date, :time, :restaurant_id, :user_id)
  end
end