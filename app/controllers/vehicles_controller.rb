class VehiclesController < ApplicationController
  before_action :require_login

  def index
    @vehicles = current_user.vehicles
  end

  def show
    vehicle = Vehicle.find(params[:id])
    @vehicle = vehicle if vehicle.user_id == current_user.id
  end

  private

    def require_login
      redirect_to login_path unless current_user
    end
end
