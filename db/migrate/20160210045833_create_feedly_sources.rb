class CreateFeedlySources < ActiveRecord::Migration
  def change
    create_table :feedly_sources do |t|
      t.string :feed_id
      t.string :title
      t.string :description
      t.string :icon_url
      t.boolean :enabled, default: true
      t.timestamps null: false
    end
  end
end
