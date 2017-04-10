class AddUserIdToJetBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :jet_bookings, :user_id, :integer
  end
end
