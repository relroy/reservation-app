class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :group_id, :integer
  add_column :users, :group_size, :integer
  end
end
