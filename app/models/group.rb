class Group < ActiveRecord::Base
  has_many :users 
  has_many :reservations
  belongs_to :boat
  
end
