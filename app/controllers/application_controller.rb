class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :pollen, :average_rating, :address, :latitude, :longitude, :description, :photo, :skill_ids])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :pollen, :average_rating, :address, :latitude, :longitude, :description, :photo, :skill_ids])
  end

    def default_url_options
      { host: ENV["www.bee-humans.xyz"] || "localhost:3000" }
    end

end
