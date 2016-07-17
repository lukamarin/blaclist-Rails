class Api::V1::SessionController < ApiController
  def sign_in
    user = User.authenticate(user_params[:email], user_params[:password])
    if user
      user.generate_access_token! unless user.access_token.present?
      render json: { access_token: user.access_token }
    else
      render json: { error: "Invalid email or password" }
    end
  end

  def sign_up
    result = CreateUser.call(params: user_params)
    if result.success?
      render json: { access_token: result.token }
    else
      render json: { error: result.error }
    end
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
