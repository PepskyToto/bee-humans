class Request < ApplicationRecord
  belongs_to :competence
  belongs_to :user
end
