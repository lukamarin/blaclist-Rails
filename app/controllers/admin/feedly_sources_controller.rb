class Admin::FeedlySourcesController < AdminController
  before_action :set_feedly_source, only: [:show, :update]
  before_action :enabled_state, only: :update

  def index
    @feedly_sources = FeedlySourcesFinder.collection(params: { page: page })
  end

  def show
  end

  def update
    @feedly_source.update(feedly_source_params)

    if !@feedly_source.enabled && @feedly_source.enabled != enabled_state
      @feedly_source.feedly_articles.destroy_all
    end

    redirect_to admin_feedly_sources_url
  end

  private

  def set_feedly_source
    @feedly_source = FeedlySource.find(params[:id])
  end

  def enabled_state
    @enabled_state ||= @feedly_source.enabled
  end

  def feedly_source_params
    params.require(:feedly_source).permit(:interest_id, :enabled)
  end
end
