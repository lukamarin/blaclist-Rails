class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :access_token, :string
  	add_column :users, :is_admin, :boolean, default: false
  end
end
