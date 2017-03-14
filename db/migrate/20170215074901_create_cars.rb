class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :type
      t.string :brand
      t.string :model
      t.text :description
      t.integer :seats
      t.integer :power
      t.integer :top_speed
      t.string :engine
      t.integer :fuel_on_city
      t.integer :fuel_on_hightway
      t.float :daily_rental
      t.float :price_per_miles
      t.float :deposit
      t.integer :daily_miles
      t.integer :extra_price_per_mile

      t.timestamps
    end
  end
end
