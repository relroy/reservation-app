class AddColumnsToBoats < ActiveRecord::Migration
  def change
    add_column :boats, :half_credit_AM_MTWTh, :integer
    add_column :boats, :half_credit_PM_MTWTh, :integer
    add_column :boats, :half_credit_AM_F, :integer
    add_column :boats, :half_credit_PM_F, :integer
    add_column :boats, :half_credit_AM_SAT, :integer
    add_column :boats, :half_credit_PM_SAT, :integer
    add_column :boats, :half_credit_AM_SUN, :integer
    add_column :boats, :half_credit_PM_SUN, :integer
    add_column :boats, :full_credit_MTWTh, :integer
    add_column :boats, :full_credit_F, :integer
    add_column :boats, :full_credit_SAT, :integer
    add_column :boats, :full_credit_SUN, :integer
    add_column :boats, :type, :string
    add_column :boats, :two_thirds_credits_total, :integer
    add_column :boats, :full_credits_total, :integer
    remove_column :boats, :half_day_credits, :integer
    remove_column :boats, :full_day_credits, :integer
    remove_column :boats, :multi_day_credits, :integer
  end
end
