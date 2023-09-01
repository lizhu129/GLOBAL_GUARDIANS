class ServicesController < ApplicationController
  def index
    @services = Service.all
    @users = User.all
  end

  def show
    @service = Service.find(params[:id])
    @booking = Booking.new
  end

  def new
    @user = current_user
    @service = Service.new
    @service.build_availability
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    if @service.save
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :description, :price_per_day, :category, :active, :min_service_day, :photo, availability_attributes: [:start_date, :end_date, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday])
  end

end
