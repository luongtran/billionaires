class CreateJetBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :jet_bookings do |t|
      t.string :departure_city
      t.string :arrival_city
      t.datetime :departure_date
      t.datetime :return_date

      t.timestamps
    end
  end
end
