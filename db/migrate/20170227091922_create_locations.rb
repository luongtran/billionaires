class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.float :lat
      t.float :lng
      t.float :distance
      t.string :address
      t.references :city
      t.references :state
      t.references :country
      t.references :locatable, polymorphic: true

      t.timestamps
    end
    add_index  :locations, [:lat, :lng]
  end
end
