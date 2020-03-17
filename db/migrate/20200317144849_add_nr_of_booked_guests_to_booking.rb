class AddNrOfBookedGuestsToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :nr_of_booked_guests, :integer
  end
end
