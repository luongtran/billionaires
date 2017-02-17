class CreateYatches < ActiveRecord::Migration[5.0]
  def change
    create_table :yatches do |t|
      t.string :yatch_type
      t.string :brand_name
      t.string :model_name
      t.text :description
      t.string :classification
      t.integer :seats
      t.integer :range
      t.integer :luggage_capacity

      t.timestamps
    end
  end
end
