class AddCaptainColumnToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :captain, :string
  end
end
