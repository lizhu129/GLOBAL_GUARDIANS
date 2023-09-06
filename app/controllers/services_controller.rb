class ServicesController < ApplicationController
  def index
    @services = Service.all
    @users = User.all

    if params[:query].present?
    sql_subquery = "name ILIKE :query OR category ILIKE :query"
    @services = @services.where(sql_subquery, query: "%#{params[:query]}%")
    end
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

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    @service.update(service_params)
    redirect_to service_path(@service)
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_path, status: :see_other
  end

  private

  def service_params
    params.require(:service).permit(:name, :description, :price_per_day, :category, :active, :min_service_day, :photo, availability_attributes: [:start_date, :end_date, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday])
  end
end
