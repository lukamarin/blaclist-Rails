class InterestsFinder < BaseFinder
  def collection
    Interest.where(interest_type: 'user')
  end
end