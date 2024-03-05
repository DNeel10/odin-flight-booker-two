class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.integer :arrival_airport_id
      t.integer :departure_airport_id
      t.datetime :departure_time
      t.integer :duration

      t.timestamps
    end
  end
end
