class Chatroom < ApplicationRecord

  has_many :messages
  belongs_to :helper, :class_name => 'User'
  belongs_to :needer, :class_name => 'User'
  belongs_to :request
end
