class FeedlyArticlesFinder < BaseFinder
  def collection
    sources = FeedlySource.all.joins(:interests).where(interests: { id: interests }).pluck(:id)
    if need_providers?
      common_sources = FeedlySource.all.joins(:interests).where(interests: { interest_type: 'provider' }).pluck(:id)
      sources = (sources + common_sources).uniq
    end
    articles = FeedlyArticle.where(feedly_source_id: sources).order(publish_date: :desc)
    articles = articles.page(page).per(per_page) if paginate?
    articles
  end

  private

  def interests
    context[:interests_ids]
  end

  def need_providers?
    @params[:need_providers]
  end
end