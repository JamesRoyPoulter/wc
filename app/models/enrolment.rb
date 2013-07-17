class Enrolment < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  attr_accessible :enrolment_date, :enrolment_status, :payment_status, :user_id, :event_id


end
