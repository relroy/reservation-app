class AddColumnsToTimeBlocks < ActiveRecord::Migration
  def change
    add_column :time_blocks, :half_credit_AM_MTWTh, :integer
    add_column :time_blocks, :half_credit_PM_MTWTh, :integer
    add_column :time_blocks, :half_credit_AM_F, :integer
    add_column :time_blocks, :half_credit_PM_F, :integer
    add_column :time_blocks, :half_credit_AM_SAT, :integer
    add_column :time_blocks, :half_credit_PM_SAT, :integer
    add_column :time_blocks, :half_credit_AM_SUN, :integer
    add_column :time_blocks, :half_credit_PM_SUN, :integer
    add_column :time_blocks, :full_credit_MTWTh, :integer
    add_column :time_blocks, :full_credit_F, :integer
    add_column :time_blocks, :full_credit_SAT, :integer
    add_column :time_blocks, :full_credit_SUN, :integer

  end
end
