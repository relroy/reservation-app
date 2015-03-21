class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :full_share, :string
    remove_column :users, :two_thirds_share, :string
    remove_column :users, :boat_assigned, :string
  end
end
