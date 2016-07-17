class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def app_config
    # /config/secrets.yml
    Rails.application.secrets
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def render_500
    render plain: '500 Internal Server Error', status: 500
  end

  def force_to_login
    session[:return_to] = request.fullpath
    redirect_to login_url
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
