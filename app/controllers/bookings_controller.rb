class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build
    params[:num_passengers].to_i.times { @booking.build_passenger }

  end

  def create
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.create(booking_params)

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end

  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

    def booking_params
      params.require(:booking).permit(:flight, passenger_attributes: [:firstname, :lastname, :email ])
    end
end
