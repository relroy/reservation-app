class AddCreditsUsedColumnToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :credits_used, :integer
  end
end
