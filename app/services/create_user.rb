class CreateUser
  include Interactor

  delegate :params, to: :context

  def call
    user = User.new(params)
    user.save
    if user.errors.present?
      context.fail!(error: user.errors)
    else
      user.generate_access_token!
      context.token = user.access_token
    end
  end

  private

  def password
    params[:password]
  end

  def password_confirmation
    params[:password_confirmation]
  end
end