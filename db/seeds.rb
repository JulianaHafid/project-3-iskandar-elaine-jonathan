# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user_list = [
#   [ "Kevin Tan", "81234567", "kevintan@email.com", false],
#   [ "Jane Lim", "91234567", "janelim@email.com", false],
#   [ "Vincent Goh", "88881122", "vincentgoh@email.com", false],
#   [ "David Lee", "91191191", "davidlee@email.com", true]
# ]
#
# user_list.each do |name, contact, email, is_Admin|
#   User.create(name: name, contact: contact, email: email, is_Admin: is_Admin)
# end

# User.create(name: "Kevin Tan", contact: "81234567", email: "kevintan@email.com", is_Admin: false)

User.create do |user|
  user.name = 'Elaine'
  user.email = 'elaine@gmail.com'
  user.contact = 91239595
  user.is_Admin = true
  user.password = "project3"
  user.password_confirmation = "project3"
end

5.times do
  Event.create!(user_id: 1, name: Faker::LordOfTheRings.character, location: Faker::Pokemon.location, date: Faker::Date.between(Date.today, 70.days.from_now), time: "15:00:00", image_url: Faker::LoremPixel.image("400x300", false, 'food'))
end


puts "Finished DB seeding."
