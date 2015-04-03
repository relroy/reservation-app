class Reservation < ActiveRecord::Base

  
  
  belongs_to :user
  belongs_to :group
  belongs_to :boat
  belongs_to :time_block

  
  

end
