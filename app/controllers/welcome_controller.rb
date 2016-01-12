class WelcomeController < ApplicationController
  before_action :redirect_if_logged_in

  def index
  end

  private

    def redirect_if_logged_in
      if current_user
        redirect_to dashboard_path
      end
    end
end
