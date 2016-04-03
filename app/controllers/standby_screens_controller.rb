class StandbyScreensController < ApplicationController
  def show
    return redirect_to client_screen_path if request.user_agent =~ /iPhone|iPad|Android/
  end
end
