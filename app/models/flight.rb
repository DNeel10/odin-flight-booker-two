class Flight < ApplicationRecord
  # scope :search,  -> (params) { where("departure_airport_id = ?", params[:departure_airport])
  #     .where("arrival_airport_id = ?", params[:arrival_airport])
  #     .where("DATE(departure_date) = ?", params[:departure_date]) }

  belongs_to :departure_airport, class_name: 'Airport', inverse_of: 'departing_flights'
  belongs_to :arrival_airport, class_name: 'Airport', inverse_of: 'arriving_flights'

  has_many :bookings
  has_many :passengers, through: :bookings

  validates :departure_airport_id, presence: true
  validates :arrival_airport_id, presence: true
  validates :departure_date, presence: true
  validates :duration, presence: true

  # Trying to move from a class method to a scope
  def self.search(params)
    where('departure_airport_id = ?', params[:departure_airport])
      .where('arrival_airport_id = ?', params[:arrival_airport])
      .where("date(departure_date) = ?", params[:departure_date])
  end

  def self.ordered_date_options
    order(:departure_date).map(&:flight_date_formatted).uniq
  end
  
  def flight_date_formatted
    departure_date.strftime("%Y-%m-%d")
  end
end
