class ChangeHarborsToHarbor < ActiveRecord::Migration
  def change
  	change_table :boats do |t|
  		t.rename :harbors, :harbor
  	end
  end
end
