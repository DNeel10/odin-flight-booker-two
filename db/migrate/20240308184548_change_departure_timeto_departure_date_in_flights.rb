class ChangeDepartureTimetoDepartureDateInFlights < ActiveRecord::Migration[7.1]
  change_table :flights do |t|
    t.rename :departure_time, :departure_date
    
  end
end
