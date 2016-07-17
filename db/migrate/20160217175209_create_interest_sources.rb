class CreateInterestSources < ActiveRecord::Migration
  def change
    create_table :interest_sources do |t|
      t.integer :interest_id
      t.integer :feedly_source_id
      t.timestamps null: false
    end
  end
end
