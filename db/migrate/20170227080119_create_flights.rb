class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.string :status
      t.string :number
      t.string :origin_airport_code
      t.string :destination_airport_code
      t.string :origin
      t.string :destination
      t.datetime :start_at
      t.datetime :end_at
      t.datetime :actual_start_at
      t.datetime :actual_end_at
      t.text :logs
      t.references :jet

      t.timestamps
    end
  end
end
