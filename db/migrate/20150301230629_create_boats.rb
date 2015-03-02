class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string :name
      t.string :type
      t.integer :size
      t.string :harbor
      t.decimal :total_shares

      t.timestamps null: false
    end
  end
end
