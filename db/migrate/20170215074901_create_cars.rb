class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :type
      t.string :brand
      t.string :model
      t.text :description
      t.integer :seats
      t.integer :power
      t.integer :max_speed
      t.string :engine
      t.string :fuel_on_city
      t.float :daily_rental

      t.timestamps
    end
  end
end
