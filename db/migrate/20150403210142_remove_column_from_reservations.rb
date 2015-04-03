class RemoveColumnFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :boat_id, :string
  end
end
