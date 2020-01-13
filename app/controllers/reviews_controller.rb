class ReviewsController < ApplicationController
  before_action :set_spaceship, only: [:index, :new, :create]
  def index
    @reviews = Review.all
  end

  def new
    authorize @ship
    @ship = Spaceship.find(params[:spaceship_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.spaceship = @ship
    authorize @review

    if @review.save
      redirect_to spaceship_path(@ship)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

  def set_spaceship
    @ship = Spaceship.find(params[:spaceship_id])
  end

end
