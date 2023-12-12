class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :helper
  belongs_to :requete
end
