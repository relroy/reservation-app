class AddColumnsToGroup < ActiveRecord::Migration
  def change
  add_column :groups, :group_id, :integer
  add_column :groups, :group_size, :integer
  add_column :groups, :user_id, :integer
  end
end
