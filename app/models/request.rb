class Request < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  has_one :chatroom

end
