class AddColumnToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :boat_id, :string
  end
end
