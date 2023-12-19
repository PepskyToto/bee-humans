class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @users = User.all
    if current_user
    @nearby_users = User.near([current_user.latitude, current_user.longitude], 10) # 10 kilomètres de distance (ajustez selon vos besoins)
    @markers = @nearby_users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "user_info", locals: { user: user }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end
  end
end
