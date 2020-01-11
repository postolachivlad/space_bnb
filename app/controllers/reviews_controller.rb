class ReviewsController < ApplicationController

  def index
    set_spaceship
    @reviews = Review.all
  end

  def new
    set_spaceship
    authorize @ship
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    set_spaceship
    @review.spaceship = @ship
    authorize @review
    @review.save
    redirect_to spaceship_path(@ship)
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

  def set_spaceship
    @ship = Spaceship.find(params[:spaceship_id])
  end

end
