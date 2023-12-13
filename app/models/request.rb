class Request < ApplicationRecord
  belongs_to :user
  belongs_to :competence, class_name: 'Skill'
  has_one :chatroom

end
