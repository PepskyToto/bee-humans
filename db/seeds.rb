# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Geocoder.configure(timeout: 5)
puts "Destroying ancient messages, chatrooms, users..."
Message.destroy_all
Chatroom.destroy_all
User.destroy_all
puts "generating new Users"
user1 = User.create(username: "jf_vt", email: "jfvernet@icloud.com", password: "azerty", address: "17 avenue Henri Barbusse, Nice, France", average_rating: 5, description: "Jean-François, 34 ans, passionné de photographie et de voyages. Aime explorer de nouvelles cultures.")
user2 = User.create(username: "Super-Toto", email: "toto@gmail.com", password: "azerty", address: "11 impasse Jeanne Marlin, Nice, France", description: "Thomas, dit 'Toto', 28 ans, fan de sports extrêmes et de nature. Toujours prêt pour une aventure en montagne.")
user3 = User.create(username: "Super-doudz", email: "doudz@gmail.com", password: "azerty", address: "123 avenue saint-lambert, Nice, France", description: "David, 31 ans, passionné de cuisine et de musique jazz. Adore expérimenter de nouvelles recettes.")
user4 = User.create(username: "Aurore", email: "aurore@gmail.com", password: "azerty", address: "4 boulevard de la madeleine, Nice, France", description: "Aurore, 26 ans, amoureuse de la littérature et des chats. Passe son temps libre à écrire des poèmes.")
user5 = User.create(username: "Dorian", email: "dorian@gmail.com", password: "azerty", address: "10 rue de la buffa, Nice, France", description: "Dorian, 23 ans, geek et passionné de nouvelles technologies. Toujours à jour sur les dernières innovations.")
user6 = User.create(username: "Canberra", email: "canberra@gmail.com", password: "azerty", address: "2 rue du maréchal Joffre, Nice, France", description: "Camille, 29 ans, fan de randonnée et de photographie. Aime capturer la beauté de la nature.")
user7 = User.create(username: "Mamandu06", email: "natalia@gmail.com", password: "azerty", address: "8 rue Gioffredo, Nice, France", description: "Natalia, 36 ans, mère de deux enfants et passionnée de jardinage. Trouve sa paix dans son jardin urbain.")
user8 = User.create(username: "Jp", email: "Jp06435@gmail.com", password: "azerty", address: "25 avenue des fleurs, Nice, France", description: "Jean-Pierre, 42 ans, amateur de vin et de fromage. Organise souvent des dégustations pour ses amis.")





puts "Destroying Skills..."
Skill.destroy_all
puts "generating new Skill"
categories = ["Couture", "Electronique", "Electrique", "Plomberie", "Carrosserie", "Informatique"]
skills = categories.map { |category| Skill.create(category: category) }


puts "Assigning skills to users..."
user1.skills << skills[0] << skills[1] << skills[2]
user2.skills << skills[3] << skills[4] << skills[5] << skills[2] << skills[1]
user3.skills << skills[3] << skills[1] << skills[5] << skills[2]
user4.skills << skills[0] << skills[4] << skills[1] << skills[2]
user5.skills << skills[3] << skills[2] << skills[5] << skills[1]
user6.skills << skills[1] << skills[4] << skills[0] << skills[2]
user7.skills << skills[3] << skills[4] << skills[5] << skills[1]
user8.skills << skills[1] << skills[2] << skills[3] << skills[4]

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

user3.requests.create(
  title: "Installation de luminaires design",
  description: "Je cherche un électricien pour installer des luminaires design dans mon nouvel appartement.",
  skill: skills[2],
  date: Date.today + 1,
  address: "123 avenue saint-lambert, Nice, France"
)


user4.requests.create(
  title: "Réparation de fuite d'eau dans la salle de bain",
  description: "Urgent : fuite d'eau dans la salle de bain. Besoin d'un plombier expérimenté.",
  skill: skills[3],
  date: Date.today,
  address: "4 boulevard de la madeleine, Nice, France"
)


user5.requests.create(
  title: "Retouches carrosserie sur voiture ancienne",
  description: "Recherche un expert en carrosserie pour des retouches sur une voiture de collection.",
  skill: skills[4],
  date: Date.today + 1,
  address: "10 rue de la buffa, Nice, France"
)

user6.requests.create(
  title: "Optimisation de réseau domestique",
  description: "Besoin d'une aide professionnelle pour optimiser mon réseau domestique et améliorer la sécurité.",
  skill: skills[5],
  date: Date.today,
  address: "2 rue du maréchal Joffre, Nice, France"
)

user7.requests.create(
  title: "Customisation de vêtements pour un projet artistique",
  description: "Je recherche quelqu'un qui peut customiser des vêtements pour un projet artistique unique.",
  skill: skills[0],
  date: Date.today,
  address: "8 rue Gioffredo, Nice, France"
)

user8.requests.create(
  title: "Dépannage d'un équipement audio professionnel",
  description: "Mon équipement audio professionnel ne fonctionne plus. Besoin d'une réparation urgente.",
  skill: skills[1],
  date: Date.today,
  address: "25 avenue des fleurs, Nice, France"
)


puts "request created successfully"

puts "Creating Reviews..."
review = Review.create(rating: 4, description: "il a dead ça", reviewer_id: user1.id, reviewee_id: user2.id)
review2 = Review.create( rating: 5, description: "mon jean est réparé!", reviewer_id: user1.id, reviewee_id: user2.id)

Review.create(rating: 5, description: "Travail impeccable, très professionnel et à l'écoute.", reviewer_id: user1.id, reviewee_id: user3.id)
Review.create(rating: 4, description: "Bonne expérience, mais la communication pourrait être améliorée.", reviewer_id: user2.id, reviewee_id: user1.id)


Review.create(rating: 3, description: "Service correct, mais des retards dans la livraison.", reviewer_id: user3.id, reviewee_id: user2.id)
Review.create(rating: 5, description: "Excellente prestation, très satisfait du résultat!", reviewer_id: user4.id, reviewee_id: user2.id)

# Reviews pour User 3
Review.create(rating: 2, description: "Prestation en dessous des attentes, déçu du résultat.", reviewer_id: user5.id, reviewee_id: user3.id)
Review.create(rating: 5, description: "Service exceptionnel, je recommande vivement!", reviewer_id: user6.id, reviewee_id: user3.id)

# Reviews pour User 4
Review.create(rating: 4, description: "Très bon travail, mais un peu cher.", reviewer_id: user7.id, reviewee_id: user4.id)
Review.create(rating: 1, description: "Pas satisfait, beaucoup de problèmes rencontrés.", reviewer_id: user8.id, reviewee_id: user4.id)

# Reviews pour User 5
Review.create(rating: 3, description: "Service moyen, peut mieux faire.", reviewer_id: user1.id, reviewee_id: user5.id)
Review.create(rating: 4, description: "Bonne qualité de service, recommandé.", reviewer_id: user2.id, reviewee_id: user5.id)

# Reviews pour User 6
Review.create(rating: 5, description: "Excellent, très professionnel et efficace!", reviewer_id: user3.id, reviewee_id: user6.id)
Review.create(rating: 2, description: "Déçu, le service n'était pas à la hauteur des attentes.", reviewer_id: user4.id, reviewee_id: user6.id)

# Reviews pour User 7
Review.create(rating: 4, description: "Bon service, mais la réponse a été un peu lente.", reviewer_id: user5.id, reviewee_id: user7.id)
Review.create(rating: 5, description: "Parfait, très satisfaite du service rendu!", reviewer_id: user6.id, reviewee_id: user7.id)

# Reviews pour User 8
Review.create(rating: 3, description: "Correct, mais il y a eu quelques petits soucis.", reviewer_id: user7.id, reviewee_id: user8.id)
Review.create(rating: 4, description: "Très bien, travail de qualité et dans les délais.", reviewer_id: user8.id, reviewee_id: user1.id)



puts "Reviews created successfully"
puts "Seed completed!"


# pour la seed avec photo user (ou request)
#file = URI.open(lien cloudinary ou internet)
#instanceUser.photo.attach(io: file, filename: nom, content_type: 'image/png ou jpg ou autre')
