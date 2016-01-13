class DashboardsController < ApplicationController
  def index
    @vehicles = Vehicle.new(current_user).all
  end
end
