class StandbyScreensController < ApplicationController
  before_action :redirect_mobile_view

  def show
  end

  private

  def redirect_mobile_view
    redirect_to client_screen_path if request.user_agent =~ /iPhone|iPad|Android/
  end
end
