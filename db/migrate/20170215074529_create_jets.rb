class CreateJets < ActiveRecord::Migration[5.0]
  def change
    create_table :jets do |t|
      t.string :type
      t.string :brand
      t.string :model
      t.text :description
      t.string :classification
      t.integer :seats
      t.integer :range
      t.integer :luggage_capacity
      t.float :price_per_hours
      t.timestamps
    end
  end
end
