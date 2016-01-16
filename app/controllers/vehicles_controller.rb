class VehiclesController < ApplicationController
  def index
    @vehicles = current_user.vehicles
  end

  def show
  end
end
