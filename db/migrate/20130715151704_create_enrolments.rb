class CreateEnrolments < ActiveRecord::Migration
  def change
    create_table :enrolments do |t|
      t.references :event
      t.references :user
      t.date :enrolment_date
      t.string :payment_status
      t.string :enrolment_status

      t.timestamps
    end
    add_index :enrolments, :event_id
    add_index :enrolments, :user_id
  end
end
