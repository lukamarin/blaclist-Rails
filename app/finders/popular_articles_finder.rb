class PopularArticlesFinder < BaseFinder
  def collection
    sources = PopularArticles.all.order(:title)
    sources = sources.page(page).per(per_page) if paginate?
    sources
  end
end