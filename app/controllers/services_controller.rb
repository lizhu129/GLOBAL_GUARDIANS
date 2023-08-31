class ServicesController < ApplicationController
  def index
    @services = Service.all
    @users = User.all
  end

  def show
    @service = Service.find(params[:id])
    @booking = Booking.new
  end
end
