class BookingsController < ApplicationController


  def index
    @bookings = Booking.where(user: current_user)
  end

  def new
    @service = Service.find(params[:service_id])
    @booking = Booking.new
  end

  def create
    @service = Service.find(params[:service_id])
    @booking = Booking.new(booking_params)
    @booking.service = @service
    @booking.user = current_user
    @booking.status = "pending"

    days = (@booking.end_date - @booking.start_date).to_i + 1
    @booking.total_price = days * @service.price_per_day

    if @booking.save
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
