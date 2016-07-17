class TrendingArticlesFinder < BaseFinder
  def collection
    sources = TrendingArticles.all.order(:title)
    sources = sources.page(page).per(per_page) if paginate?
    sources
  end
end