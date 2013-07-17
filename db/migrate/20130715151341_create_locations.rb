class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :capacity
      t.string :description

      t.timestamps
    end
  end
end
