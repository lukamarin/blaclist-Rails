class CreateUserInterests < ActiveRecord::Migration
  def change
    create_table :user_interests do |t|
      t.integer :interest_id, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end
  end
end
