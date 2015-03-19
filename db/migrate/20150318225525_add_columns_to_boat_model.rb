class AddColumnsToBoatModel < ActiveRecord::Migration
  def change
  add_column :boats, :service_notes, :text 
  add_column :boats, :current_status, :string
  add_column :boats, :one_day_out, :boolean, :default => false




  end
end
