class Flight < ApplicationRecord
  scope :ordered_date_options, -> { order(:departure_time).map(&:flight_date_formatted).uniq }

  belongs_to :departure_airport, class_name: 'Airport', inverse_of: 'departing_flights'
  belongs_to :arrival_airport, class_name: 'Airport', inverse_of: 'arriving_flights'

  validates :departure_airport_id, presence: true
  validates :arrival_airport_id, presence: true
  validates :departure_time, presence: true
  validates :duration, presence: true

  # def self.ordered_date_options
  #   order(:departure_time).map(&:flight_date_formatted).uniq
  # end
  
  def flight_date_formatted
    departure_time.strftime("%m/%d/%Y")
  end
end
