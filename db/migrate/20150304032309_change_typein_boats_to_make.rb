class ChangeTypeinBoatsToMake < ActiveRecord::Migration
  def change
  	change_table :boats do |t|
 		t.rename :type, :make		
  	end
  end
end
