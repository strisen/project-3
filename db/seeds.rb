# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
4.times do |index|

  # User.create(
  #   username: Faker::Name.unique.name,
  #   email: Faker::Internet.email,
  #   balance: rand(1000)
  # )
  category = {
    0 => 'Ring',
    1 => 'Necklace'
  }
  Product.create(
    name: Faker::Food.dish,
    category: category[rand(0..1)],
    description: Faker::Food.ingredient,
    picture: Faker::LoremPixel.image,
    price: rand(1000),
    status: 0,#rand(0..3),
    user_id: rand(1..2)
  )
  # Purchase.create(
  #   user_id: rand(1..10),
  #   product_id: rand(1...10)
  # )
end
