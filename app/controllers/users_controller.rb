class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_user, only: [:edit, :update]

  def show
    # show all information about user on user page
    @user = current_user
    @ships = @user.spaceships
    @bookings = @user.bookings # same as "Booking.where(user_id: @user.id)" - just cooler
    authorize @user
  end

  def edit
    # edit user information
    authorize @user
  end

  def update
    # save new information in db
    authorize @user

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.required(:user).permit(:first_name, :last_name, :photo)
  end
end
