# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |index|

  # User.create(
  #   username: Faker::Name.unique.name,
  #   email: Faker::Internet.email,
  #   balance: rand(1000)
  # )
  Product.create(
    name: Faker::Food.dish,
    category: Faker::File.extension,
    description: Faker::Food.ingredient,
    price: rand(1000),
    status: 0,#rand(0..3),
    user_id: rand(1..2)
  )
  # Purchase.create(
  #   user_id: rand(1..10),
  #   product_id: rand(1...10)
  # )
end
