class Request < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  has_one :chatroom
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo

  def distance_to_user(user)
    return nil if user.latitude.nil? || user.longitude.nil? || self.user.latitude.nil? || self.user.longitude.nil?

    user_coordinates = [user.latitude, user.longitude]
    request_coordinates = [self.latitude, self.longitude]
    Geocoder::Calculations.distance_between(user_coordinates, request_coordinates)
  end

end
