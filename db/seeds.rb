# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Airport.delete_all
puts "Deleting all Airports and creating a new set"

codes = %w(BWI IAD PHX LIT LAX SAN 
           SMF COS DEN BDL FLL MIA)
airports = []

codes.each do |code|
  airports << Airport.create({code: code})
end

Flight.delete_all
puts "Deleting all flights and creating a new set"

10000.times do |i|
  Flight.create([{departure_airport: airports.shuffle.pop , arrival_airport: airports.shuffle.pop, departure_date: DateTime.now + rand(1..10).days, duration: rand(90..360)}])
  puts("created Flight #{i}")
end

