class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :state, :string
    add_column :users, :zip_code, :string
    add_column :users, :phone, :string
    add_column :users, :boat_preference, :string
    add_column :users, :full_share, :boolean, :default => false
    add_column :users, :two_thirds_share, :boolean, :default => false
  end
end
