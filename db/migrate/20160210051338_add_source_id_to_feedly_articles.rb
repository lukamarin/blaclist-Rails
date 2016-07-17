class AddSourceIdToFeedlyArticles < ActiveRecord::Migration
  def change
  	add_column :feedly_articles, :feedly_source_id, :integer, null: false
  end
end
