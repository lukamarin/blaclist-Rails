class Admin::InterestsController < AdminController
  def index
    @interests = Interest.from_users.order(:created_at).map(&:name).join(', ')
    @providers = Interest.system.order(:created_at).map(&:name).join(', ')
  end

  def update
    update_interests if need_to_update_interests?
    update_providers if need_to_update_providers?
    head :ok
  end

  def update_interests
    interests = params[:users_keywords].split(',').map(&:strip)

    Interest.from_users.each do |interest|
      if interests.include? interest.name
        interests.delete(interest.name)
      else
        interest.destroy
      end
    end
    interests.each do |interest|
      Interest.create(name: interest, interest_type: 'user')
    end
  end

  def update_providers
    providers = params[:providers_keywords].split(',').map(&:strip)

    Interest.system.each do |interest|
      if providers.include? interest.name
        providers.delete(interest.name)
      else
        interest.destroy
      end
    end
    providers.each do |provider|
      Interest.create(name: provider, interest_type: 'provider')
    end
  end

  def need_to_update_interests?
    params[:users_keywords].present?
  end

  def need_to_update_providers?
    params[:providers_keywords].present?
  end
end
