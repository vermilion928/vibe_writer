class ClientScreensController < ApplicationController
  def show
    @chara   = Paper.last.goal_word.tap { |x| break x[rand(x.size)] }
    @hue_num = rand 360
  end
end
