class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @ship = Spaceship.find(params[:spaceship_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @ship = Spaceship.find(params[:spaceship_id])
    @booking.spaceship_id = @ship.id
    @booking.user_id = @ship.user_id
    # check if actions is working after finish the view form

    if @booking.save
      #redirect user(@spaceship)
    else
      render :new
    end
    authorize @booking
  end

  # discus with teammates if we will need other actions for this controller

  private

  def booking_params
    params.required(:booking).permit(:start_date, :end_date, :user_id, :spaceship_id, :created_at, :updated_at)
  end
end
