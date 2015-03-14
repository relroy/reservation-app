class AddColumnSharesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_share, :string
    add_column :users, :two_thirds_share, :string
  end
end
