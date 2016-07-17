class FeedlySourcesFinder < BaseFinder
  def collection
    sources = FeedlySource.all.order(:title)
    sources = sources.page(page).per(per_page) if paginate?
    sources
  end
end