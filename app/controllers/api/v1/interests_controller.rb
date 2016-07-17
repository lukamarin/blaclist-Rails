class Api::V1::InterestsController < ApiController
  def index
    interests = Rails.cache.fetch(FeedlyArticle.all.cache_key(interests_count: Interest.count,
                                                              interests_ts: Interest.last.created_at)) do
      InterestsFinder.serialized_collection(InterestSerializer)
    end
    render json: interests, root: false
  end
end
