class AddDescriptionStartDateStartTimeEndDateEndTimeAddressAndPostcodeToEvent < ActiveRecord::Migration
  def change
    add_column :events, :description, :text
    add_column :events, :start_date, :datetime
    add_column :events, :start_time, :datetime
    add_column :events, :end_date, :datetime
    add_column :events, :end_time, :datetime
    add_column :events, :address, :string
    add_column :events, :postcode, :string

  end
end
