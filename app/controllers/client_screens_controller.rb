class ClientScreensController < ApplicationController
  def show
    @chara   = [*'a'..'z'].sample
    @hue_num = rand 360
  end
end
