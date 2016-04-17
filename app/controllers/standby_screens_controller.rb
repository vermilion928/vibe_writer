class StandbyScreensController < ApplicationController
  def show
    return redirect_to client_screen_path if request.user_agent =~ /iPhone|iPad|Android/
    @paper = Paper.last.tap { |x| break x.word[x.goal_word] ? Paper.create(goal_word: I18n.t(:dictionary)[@lebel]) : x }
  end
end
