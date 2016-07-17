class Api::V1::HomefeedController < ApiController
  before_action :authenticate!

  def index
    interests_ids = current_user.interests.pluck(:id)
    articles = FeedlyArticlesFinder.serialized_collection(FeedlyArticleSerializer,
                                interests_ids: interests_ids, params: { page: page, need_providers: true})
    render json: articles, root: false
  end
end
