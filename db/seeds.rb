# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "cleaning database"

Adventure.destroy_all
User.destroy_all

puts "creating user"

user = User.new
user.email = 'test.marco@example.com'
user.password = 'valid_passwordnice'
user.password_confirmation = 'valid_passwordnice'
user.save!

puts "user created"

puts "creating adventures"

20.times do
  adventure = Adventure.new(
    number_of_guests: rand(0..6),
    location: Faker::Address.full_address,
    price: rand(20..987),
    languages: "English",
    description: Faker::Lorem.paragraph,
    user: user,
    name: Faker::FunnyName.name,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
  )
  adventure.save!
end


puts "I am done"
