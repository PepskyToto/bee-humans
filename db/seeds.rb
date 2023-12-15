# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Destroying ancient messages, chatrooms, users..."
Message.destroy_all
Chatroom.destroy_all
User.destroy_all
puts "generating new Users"
user1 = User.create(username: "jf_vt", email: "jfvernet@icloud.com", password: "azerty", address: "17 avenue Henri Barbusse, Nice, France", average_rating: 5)
user2 = User.create(username: "Super-Toto", email: "toto@gmail.com", password: "azerty", address: "11 impasse Jeanne Marlin, Nice, France")

puts "Destroying Skills..."
Skill.destroy_all
puts "generating new Skill"
categories = ["Couture", "Electronique", "Electrique", "Plomberie", "Carrosserie", "Informatique"]
skills = categories.map { |category| Skill.create(category: category) }


puts "Assigning skills to users..."
user1.skills << skills[0] << skills[1] << skills[2]
user2.skills << skills[3] << skills[4] << skills[5] << skills[2]

puts "creating request..."
user2.requests.create(
  title: "Aide pour réparer une robe",
  description: "Je cherche quelqu'un qui peut m'aider à réparer ma robe.",
  skill: skills[0],
  date: Date.today,
  address: "25 Avenue des Fleurs, Nice, France"
)

user2.requests.create(
  title: "Besoin d'aide pour une panne électrique",
  description: "Ma lampe ne s'allume plus, j'ai besoin d'aide pour réparer la panne électrique.",
  skill: skills[2],
  date: Date.tomorrow,
  address: "8 Rue de la Buffa, Nice, France"
)

user1.requests.create(
  title: "Problème de plomberie dans la cuisine",
  description: "Il y a une fuite d'eau dans ma cuisine, j'aurais besoin d'aide pour réparer la plomberie.",
  skill: skills[3],
  date: Date.today,
  address: "10 Rue Gioffredo, Nice, France"
)

user1.requests.create(
  title: "Besoin d'aide en informatique",
  description: "Mon ordinateur ne fonctionne pas correctement, j'ai besoin de quelqu'un qui s'y connaît en informatique.",
  skill: skills[5],
  date: Date.tomorrow,
  address: "15 Avenue Notre Dame, Nice, France"
)
puts "request created successfully"

puts "Creating Reviews..."
review = Review.create(rating: 4, description: "il a dead ça", reviewer_id: user1.id, reviewee_id: user2.id)
review2 = Review.create( rating: 5, description: "mon jean est réparé!", reviewer_id: user1.id, reviewee_id: user2.id)
puts "Reviews created successfully"

puts "Seed completed!"
