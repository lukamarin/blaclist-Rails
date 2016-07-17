class SessionController < ApplicationController
  def new
  end

  def create
    if @user = login(user_params[:email], user_params[:password], true)
      requested_url = session[:return_to] || admin_root_url
      session[:return_to] = nil
      redirect_to requested_url
    else
      render action: 'new'
    end
  end

  def destroy
    user = current_user
    before_logout!(user)
    user.forget_me!
    @current_user = nil
    reset_sorcery_session
    redirect_to sign_in_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
