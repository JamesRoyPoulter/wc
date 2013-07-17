class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :event
      t.references :location
      t.date :booking_date
      t.string :time_slot

      t.timestamps
    end
    add_index :bookings, :event_id
    add_index :bookings, :location_id
  end
end
