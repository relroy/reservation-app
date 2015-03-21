class RemoveColumnSizeFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :group_size, :integer
  end
end
