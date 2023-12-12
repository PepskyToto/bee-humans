class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :username, presence: true
  validates :address, presence: true
  
  has_many :reviews, dependent: :destroy
  has_many :requests,  dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
  has_many :users_skills
  has_many :skills, through: :users_skills
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end
