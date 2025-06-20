# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

PaymentType.create(name: "Kartica")
PaymentType.create(name: "Gotovina")
PaymentType.create(name: "Revolut")
PaymentType.create(name: "Prijenos na Revolut")
PaymentType.create(name: "Podizanje gotovine")
PaymentType.create(name: "Uplata gotovine")

Category.create(name: "Cuga")
Category.create(name: "Gorivo")
Category.create(name: "Naknada za vođenje računa")
Category.create(name: "Parking")
Category.create(name: "Sjednica općinskog vijeća Općine Kostrena")
Category.create(name: "Chasing Nord")
Category.create(name: "Soulcase")
Category.create(name: "Valovi")
