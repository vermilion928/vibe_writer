class StandbyScreensController < ApplicationController
  def show
    return redirect_to client_screen_path if request.user_agent =~ /iPhone|iPad|Android/

    current_word = I18n.t(:dictionary)[Paper.count % I18n.t(:dictionary).size]
    @paper       = Paper.last.tap { |x| break (x.nil? || x.word[x.goal_word]) ? Paper.create(goal_word: current_word) : x }
  end
end
