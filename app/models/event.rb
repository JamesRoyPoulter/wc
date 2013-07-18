class Event < ActiveRecord::Base
  attr_accessible :event_image, :name, :price, :creator_id, :description, :start_time, :start_date, :end_date, :end_time, :address, :postcode

  belongs_to :creator, class_name: 'User'

  has_many :bookings
  has_many :locations, through: :bookings
  has_many :enrolments
  has_many :users, through: :enrolments

  mount_uploader :event_image, EventImageUploader


end