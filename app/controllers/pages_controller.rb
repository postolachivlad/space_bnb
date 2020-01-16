class PagesController < ApplicationController

  def home
    @ships = policy_scope(Spaceship)
  end
end


