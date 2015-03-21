class RemoveColumnsFromGroupSizeAndId < ActiveRecord::Migration
  def change
    remove_column :groups, :group_size, :integer
    remove_column :groups, :group_id,  :integer
    remove_column :groups, :user_id, :integer
  end
end
