class ChangeUserColums < ActiveRecord::Migration
  def change
    remove_column :users, :boat_preference, :string
    add_column :users, :sailing_experience, :text
  end
end
