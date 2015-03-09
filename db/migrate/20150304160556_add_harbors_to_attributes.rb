class AddHarborsToAttributes < ActiveRecord::Migration
  def change
  add_column :boats, :harbors, :string
  end
end
