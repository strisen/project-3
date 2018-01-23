# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |index|
  new_listing = Listing.new

  new_listing.name = Faker::Name.house + "'s gold"
  new_listing.seller_name = Faker::Name.unique.name
  new_listing.description = Faker::Lovecraft.fhtagn(index)
  new_listing.picture = Faker::LoremPixel.image("300x200", false, 'nature')

  new_park.save
end
