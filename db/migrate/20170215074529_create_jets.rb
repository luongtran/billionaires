class CreateJets < ActiveRecord::Migration[5.0]
  def change
    create_table :jets do |t|
      t.string :type
      t.string :brand
      t.string :model
      t.string :aircraft_profile
      t.text :description
      t.string :classification
      t.integer :passengers
      t.integer :sleeps
      t.integer :range
      t.integer :luggage_capacity
      t.integer :max_operating_speed
      t.integer :max_takeoff_weight
      t.float :price_per_hours
      t.timestamps
    end
  end
end
