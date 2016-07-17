class Api::V1::UserController < ApiController
  before_action :authenticate!
  
  def update_interests
    if params[:interests].blank?
      render json: { error: 'provide <interests> param (id1,id2,id3...) format'}
    else
      current_user.interests.delete_all
      current_user.interests << Interest.where(id: user_interests)
      head :ok
    end
  end

  private

  def user_interests
    params[:interests].split(",")
  end
end
