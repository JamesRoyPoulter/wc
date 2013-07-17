class Booking < ActiveRecord::Base
  belongs_to :event
  belongs_to :location
  attr_accessible :booking_date, :time_slot, :location_id, :event_id
end
