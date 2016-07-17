class ApiController < ActionController::Base
  layout nil

  def not_found
    head :not_found
  end

  def current_user
    @current_user ||= User.find_by(access_token: params[:access_token]) if params[:access_token]
  end

  def authenticate!
    render json: { error: "Not Authorized" } unless current_user
  end

  def page
    @page ||= begin
      params[:page].blank? ? 1 : params[:page]
    end
  end
end
