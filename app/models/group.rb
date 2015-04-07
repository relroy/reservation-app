class Group < ActiveRecord::Base

  belongs_to :user 
  has_many :reservations
  belongs_to :boat
  has_many :users
  
end
