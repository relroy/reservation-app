class Boat < ActiveRecord::Base
  has_many :users
  has_many :reservations

end
