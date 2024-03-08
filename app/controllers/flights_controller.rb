class FlightsController < ApplicationController
  def index
    @flights = Flight.search(search_params)
    
    @airport_options = Airport.all.map { |a| [a.code, a.id] }
    @date_options = Flight.ordered_date_options
  end

  private

    def search_params
      params.permit(:departure_airport, :arrival_airport, :departure_date, :num_passengers)
    end
end
