class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :car_type
      t.string :brand_name
      t.string :model_name
      t.text :description
      t.integer :seats
      t.integer :power
      t.integer :max_speed
      t.string :engine

      t.timestamps
    end
  end
end
