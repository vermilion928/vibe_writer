class ClientScreensController < ApplicationController
  def show
    @chara   = [*'a'..'z'][rand 26]
    @hue_num = rand 360
  end
end
