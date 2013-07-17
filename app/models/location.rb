class Location < ActiveRecord::Base
  attr_accessible :capacity, :description, :name

  has_many :bookings


end
