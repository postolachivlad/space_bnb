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
    # added status = 0 in order to set initial save to "requested"
    @booking.status = 0
    @ship = Spaceship.find(params[:spaceship_id])
    @booking.spaceship = @ship
    @booking.user = current_user
    # check if actions is working after finish the view form
    if @booking.save
      redirect_to user_path(@booking.user)
    else
      render :new
    end
    authorize @booking
  end

  def edit
    @booking = Booking.find(params[:id])
    @user = User.find(params[:user_id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(status: params[:user][:booking][:status])
    authorize @booking

    redirect_to user_path(@booking.user)
  end

  private

  def booking_params
    params.required(:booking).permit(:start_date, :end_date, :user_id, :spaceship_id, :status, :created_at, :updated_at)
  end
end
