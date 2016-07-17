class AddFeedlyIdToFeedlyArticles < ActiveRecord::Migration
  def change
  	add_column :feedly_articles, :feedly_id, :string
  end
end
