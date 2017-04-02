class AddCustomerInforToCarBooking < ActiveRecord::Migration[5.0]
  def change
    change_table :car_bookings do |t|
      t.string :name
      t.string :surname
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :driver_licence
      t.datetime :bithrday
      t.datetime :start_date
      t.datetime :end_date
      t.text :additional_information
      t.string :state_license_was_issued
      t.string :insurance_carrier
      t.string :policy
    end
  end
end
