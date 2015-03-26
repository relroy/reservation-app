class Boat < ActiveRecord::Base
  has_many :users
  # has_many :reservations
  has_many :groups

end
