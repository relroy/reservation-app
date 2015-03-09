class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string :image_url
      t.string :name
      t.string :type
      t.integer :size
      t.integer :shares_possible
      t.decimal :full_share_price, precision: 6, scale: 2
      t.decimal :two_thirds_share_price, precision: 6, scale: 2
      t.integer :half_day_credits
      t.integer :full_day_credits
      t.integer :multi_day_credits

      t.timestamps null: false
    end
  end
end
