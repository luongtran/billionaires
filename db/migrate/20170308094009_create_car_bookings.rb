class CreateCarBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :car_bookings do |t|
      t.references :car, foreign_key: true
      t.references :user, foreign_key: true
      t.references :city
      t.references :country
      t.boolean :chauffeur, default: false
      t.string :status
      t.string :pick_up_address
      t.string :pick_up_lat
      t.string :pick_up_lng
      t.datetime :pick_up_time
      t.datetime :arrival_time
      t.string :destination_address
      t.string :destination_lat
      t.string :destination_lng
      t.float :estimate_distance
      t.float :estimate_price
      t.timestamps
    end
  end
end
