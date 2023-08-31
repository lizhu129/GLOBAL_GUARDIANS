class BookingsController < ApplicationController


  def index
    @bookings = Booking.where(user: current_user)
    @user_bookings = Booking.joins(:service).where(services: { user_id: current_user.id })
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

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: "accepted")
    redirect_to bookings_path, notice: 'Booking was successfully accepted.'
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(status: "declined")
    redirect_to bookings_path, notice: 'Booking was successfully declined.'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
