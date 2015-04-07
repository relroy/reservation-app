class RemoveBoatAssignedColumnFromGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :boat_assigned, :string
  end
end
