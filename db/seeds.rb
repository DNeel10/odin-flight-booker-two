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
           SMF COS DEN BDL FLL MIA 
           MCO TPA HNL ORD IND FWA 
           ICT SDF MSY PWM BOS DTW 
           MSP MCI JAN BIL LNK OMA 
           MHT LAS ACY EWR ABQ BUF
           JFK SYR AVL RDU FAR CVG
           DAY OKC TUL EUG PDX PHL 
           PIT PVD CHS GSP FSD TRI 
           MEM BNA HOU DFW SAT SLC 
           BTV RIC SEA CRW GRB MKE 
           JAC CYS)
airports = []

codes.each do |code|
  airports << Airport.create({code: code})
end

Flight.delete_all
puts "Deleting all flights and creating a new set"

1000.times do |i|
  Flight.create([{departure_airport: airports.shuffle.pop , arrival_airport: airports.shuffle.pop, departure_time: DateTime.now + rand(1..30).days.from_now.day, duration: rand(90..360)}])
  puts("created Flight #{i}")
end

