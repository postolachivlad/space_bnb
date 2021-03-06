class SpaceshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_spaceship, only: [:show, :edit]

  def index
    # find all Spaceship from DB and initialize them in @ship instance
    # raise
    @ships = policy_scope(Spaceship)\

    # diferent name for instance with reason to not over write it
    @search_ships = Spaceship.search_ships(params[:query])

    # authorize @ships

    @markers = @ships.map do |ship|
      {
        lat: ship.latitude,
        lng: ship.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { ship: ship })
      }
    end
  end

  def show
    # find the spaceship by id in DB to show all it info on 'show' page
    set_spaceship
    authorize @ship
    # initialize intanse with user of ship
    @user = User.where(id: @ship.user_id)

    @reviews = Review.where(spaceship_id: @ship.id)
  end

  def new
    # initializing the '@ship' instance with empty object for 'Simple Form'
    @ship = Spaceship.new
    authorize @ship
  end

  def create
    # creating a ne Spaceship object and save it in '@ship' instance
    @ship = Spaceship.new(spaceship_params)
    # save the user id for each Spaceship object
    @ship.user = current_user

    authorize @ship

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
    authorize @ship
  end

  def update
    # initializing the '@ship' with updated values of Spaceship object
    @ship = Spaceship.find(params[:id])
    # authorize @ship
    # check if Object was saved in DB
    if @ship.update(spaceship_params)
      # redirect to Spaceship page
      authorize @ship
      redirect_to @ship
    else
      # render a new "Simple Form"
      render :edit
    end
  end

  def destroy
    # destroy the objeReview.where(spaceship_id: @ship.id)ct
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
          .permit(:name, :description, :longitude, :latitude, :region, :min_duration, :photo, :photo_cache)
  end
end
