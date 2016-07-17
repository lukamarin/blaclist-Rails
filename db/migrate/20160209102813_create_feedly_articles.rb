class CreateFeedlyArticles < ActiveRecord::Migration
  def change
    create_table :feedly_articles do |t|
      t.string :author_name
      t.string :content
      t.string :lead_image
      t.string :url
      t.string :title
      t.string :logo
      t.string :source_url
      t.datetime :publish_date
      t.timestamps null: false
    end
  end
end
