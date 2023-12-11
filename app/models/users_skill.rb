class UsersSkill < ApplicationRecord
  belongs_to :user
  belongs_to :competence
end
