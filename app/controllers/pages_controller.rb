class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @users = User.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        marker_html: render_to_string(partial: "marker")
      }
    end
  end
end
