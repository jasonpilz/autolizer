class DashboardsController < ApplicationController
  def index
    VehicleSaveWorker.perform_async(current_user.id)
  end
end
