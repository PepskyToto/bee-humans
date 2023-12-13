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
User.destroy_all
puts "generating new Users"
User.create(username: "jf_vt", email: "jfvernet@icloud.com", password: "azerty", address: "17 avenue Henri Barbusse, Nice, France")
User.create(username: "Super-Toto", email: "toto@gmail.com", password: "azerty", address: "11 impasse Jeanne Marlin, Nice, France")

puts "Destroying Skills..."
Skill.destroy_all
puts "generating new Skill"
exemples = ["Couture", "Electronique", "Eletrique", "Plomberie", "Carrosserie", "Informatique"]
exemples.each do |exemple|
  Skill.create(category: exemple)
end

puts "Assigning skills to users..."
user1.skills << skills[0] << skills[1] << skills[2]
user2.skills << skills[3] << skills[4] << skills[5]

puts "Seed completed!"