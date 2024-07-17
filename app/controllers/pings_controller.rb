class PingsController < ApplicationController
  def ping
    render json:{messages:"PONG"} 
  end
end
