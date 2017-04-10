class AddPassengersToJetBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :jet_bookings, :passengers, :integer
  end
end
