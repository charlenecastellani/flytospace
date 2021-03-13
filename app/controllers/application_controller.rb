class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :agency_name, :agency_status])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :agency_name, :agency_status])
  end

  def after_sign_in_path_for(resource)
    if current_user.agency_status == true
    stored_location_for(resource) || dashboard_voyages_path
    else 
    stored_location_for(resource) || mes_reservations_voyage_reservations_path(:voyage_id)
    end
  end
end
