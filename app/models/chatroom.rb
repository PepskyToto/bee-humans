class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :request
  has_many :messages, dependent: :destroy
end
