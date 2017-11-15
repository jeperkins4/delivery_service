class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_franchise, :current_location
  before_action :cors_preflight_check
  after_action :cors_set_access_control_headers

  autocomplete :place, :name

  expose(:franchises) { Franchise.order(:name) }

  #decent_configuration do
  #  strategy DecentExposure::StrongParametersStrategy
  #end

  def current_franchise
    return if cookies[:lat_lng].nil?
    if session[:current_franchise_id].nil?
      coords = cookies[:lat_lng].split('|')
      nearby_franchises = Franchise.near(coords, 10)
      @current_franchise = nearby_franchises.first unless nearby_franchises.empty?
    else
      @current_franchise ||= Franchise.find(session[:current_franchise_id])
    end
    return @current_franchise
  end

  def current_franchise=(franchise)
    session[:current_franchise_id] = franchise.try(:id)
  end

  def set_timezone
    Time.use_zone(current_user.time_zone) if current_user
  end

  def current_location
    return if cookies[:lat_lng].nil?
    Rails.cache.fetch("current_location_#{cookies[:lat_lng]}", expires_in: 1.hour) do
      coords = cookies[:lat_lng].split('|')
      @info ||= Geocoder.search(coords.map(&:to_f))
      @info.first.data['formatted_address']
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { render nothing: true, status: :forbidden }
      format.html { redirect_to root_url, :alert => exception.message }
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:username, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:time_zone, :name, :email, :phone, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:time_zone, :name, :email, :franchise_id, :phone, :password, :password_confirmation, :current_password) }
  end

  # For all responses in this controller, return the CORS access control headers.
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  # If this is a preflight OPTIONS request, then short-circuit the
  # request, return only the necessary headers and return an empty
  # text/plain.
  def cors_preflight_check
    if request.method == :options
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
      headers['Access-Control-Max-Age'] = '1728000'
      render :text => '', :content_type => 'text/plain'
    end
  end
end
