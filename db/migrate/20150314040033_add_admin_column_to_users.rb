class AddAdminColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :allowed, :boolean, :default => false
  end
end
