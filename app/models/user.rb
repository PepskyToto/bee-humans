class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  validates :username, presence: true
  validates :address, presence: true
  has_many :reviewer_review, class_name: 'Review', foreign_key: 'reviewer_id', dependent: :destroy
  has_many :reviewee_review, class_name: 'Review', foreign_key: 'reviewee_id', dependent: :destroy
  has_many :requests, dependent: :destroy
  # has_many :bookmarks, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :needer_chatroom, class_name: 'Chatroom', foreign_key: 'needer_id', dependent: :destroy
  has_many :helper_chatroom, class_name: 'Chatroom', foreign_key: 'helper_id', dependent: :destroy
  has_many :users_skills, dependent: :destroy
  has_many :skills, through: :users_skills
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  def distance_to_user(user)
    return nil if user.latitude.nil? || user.longitude.nil? || self.latitude.nil? || self.longitude.nil?

    current_user_coordinates = [user.latitude, user.longitude]
    user_coordinates = [self.latitude, self.longitude]
    Geocoder::Calculations.distance_between(current_user_coordinates, user_coordinates)
  end
end
