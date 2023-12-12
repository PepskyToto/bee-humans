class Request < ApplicationRecord
  belongs_to :users
  belongs_to :skills
  has_one :chatroom
end
