class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def show
  end
end
