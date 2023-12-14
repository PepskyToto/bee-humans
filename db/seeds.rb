# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Destroying ancient users..."
Message.destroy_all
Chatroom.destroy_all
User.destroy_all
puts "generating new Users"
user1 = User.create(username: "jf_vt", email: "jfvernet@icloud.com", password: "azerty", address: "17 avenue Henri Barbusse, Nice, France")
user2 = User.create(username: "Super-Toto", email: "toto@gmail.com", password: "azerty", address: "11 impasse Jeanne Marlin, Nice, France")

puts "Destroying Skills..."
Skill.destroy_all
puts "generating new Skill"
categories = ["Couture", "Electronique", "Electrique", "Plomberie", "Carrosserie", "Informatique"]
skills = categories.map { |category| Skill.create(category: category) }


puts "Assigning skills to users..."
user1.skills << skills[0] << skills[1] << skills[2]
user2.skills << skills[3] << skills[4] << skills[5] << skills[2]

puts "Creating a request..."
Request.destroy_all
request = Request.create(description: "besoin d'aide pour réparer une ampoule", title: "Problème d'électricité", skill_id: Skill.find_by_category("Electrique").id, date: Date.today, user_id: user1.id)
request2 = Request.create(description: "besoin d'aide pour réparer mon jean", title: "Jean troué", skill_id: Skill.find_by_category("Couture").id, date: Date.today, user_id: user1.id)

puts "Creating Reviews..."
review = Review.create(rating: 4, description: "il a dead ça", reviewer_id: user1.id, reviewee_id: user2.id)
review2 = Review.create( rating: 5, description: "mon jean est réparé!", reviewer_id: user1.id, reviewee_id: user2.id)

puts "Seed completed!"
