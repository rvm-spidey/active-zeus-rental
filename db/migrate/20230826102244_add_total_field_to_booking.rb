class AddTotalFieldToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :total, :integer
  end
end
