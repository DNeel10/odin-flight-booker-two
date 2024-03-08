class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @airport_options = Airport.all.map { |a| [a.code, a.id] }
    @date_options = Flight.ordered_date_options
  end
end
