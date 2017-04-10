class AddJetIdToJetBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :jet_bookings, :jet_id, :integer
  end
end
