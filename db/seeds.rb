# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

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
codes.each do |code|
  Airport.create(code: code)
end