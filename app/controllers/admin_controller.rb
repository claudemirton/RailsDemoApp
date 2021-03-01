class AdminController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "nimda"

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end
end
