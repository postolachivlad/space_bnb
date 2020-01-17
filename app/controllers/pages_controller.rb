class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @ships = policy_scope(Spaceship)
  end
end

