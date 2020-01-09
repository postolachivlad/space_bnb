class SpaceshipsController < ApplicationController
  before_action :set_spaceship, only: [:show, :edit, :destroy]

  def index
    # find all Spaceship from DB and initialize them in @ship instance
    @ships = Spaceship.all
  end

  def show
    # find the spaceship by id in DB to show all it info on 'show' page
  end

  def new
    # initializing the '@ship' instance with empty object for 'Simple Form'
    @ship = Spaceship.new
  end

  def create
    # creating a ne Spaceship object and save it in '@ship' instance
    @ship = Spaceship.new(spaceship_params)
    # save the user id for each Spaceship object
    @ship.user_id = current_user

    # check if '@ship' was saved in DB
    if @ship.save
      # after save it redirect to Spaceship page
      redirect_to @ship
    else
      # render a new empty 'Simple Form'
      render :new
    end
  end

  def edit
    # initializing the '@ship' with existing object for 'Simple Form'
  end

  def update
    # initializing the '@ship' with updated values of Spaceship object
    @ship = Spaceship.update(spaceship_params)

    # check if Object was saved in DB
    if @ship.update
      # redirect to Spaceship page
      redirect_to @ship
    else
      # render a new "Simple Form"
      render :edit
    end
  end

  def destroy
    # destroy the object
    @ship.destroy
    # redirect to Home Page
    redirect_to root_path
  end

  private

  def set_spaceship
    @ship = Spaceship.find(params[:id])
  end

  def spaceship_params
    # strong parameters method to avoid XSS
    params.required(:spaceship)
          .permit(:name, :description, :longitude, :latitude)
  end
end
