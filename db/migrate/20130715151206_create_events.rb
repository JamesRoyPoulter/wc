class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :price
      t.string :event_image

      t.timestamps
    end
  end
end
