class Boat < ActiveRecord::Base
  

  has_many :users
  has_many :reservations
  has_many :groups
  has_many :time_blocks


end
