class AdminController < ApplicationController
  layout 'admin'
  
  before_action :authenticate!
  
  def authenticate!
    force_to_login unless current_user && current_user.is_admin
  end

  def page
    @page ||= begin
      params[:page].blank? ? 1 : params[:page]
    end
  end
end
