module ApplicationHelper
  def available_on?(date)
    # Check if the date is after today's date
    after_today = date > Date.today

    # Check if the date is within the availability range of the service
    within_availability_range = date >= @service.availability.start_date && date <= @service.availability.end_date

    # First, check if this weekday is available
    weekday_available = @service.availability.send(date.strftime('%A').downcase.to_sym)

    # Next, check if this day is already booked
    booking_exists = @service.bookings.where.not(status: "declined").where("? BETWEEN start_date AND end_date", date).exists?

    # Return true if the day is available, it's after today's date, it's within the availability range, and no booking exists; otherwise false
    weekday_available && !booking_exists && within_availability_range && after_today
  end
end
