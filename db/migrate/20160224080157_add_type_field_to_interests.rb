class AddTypeFieldToInterests < ActiveRecord::Migration
  def change
    add_column :interests, :interest_type, :string
    Interest.update_all(interest_type: 'user')
  end
end
