class ChangeDateFormatInBookings < ActiveRecord::Migration[5.0]
  def change
    change_column :bookings, :start_time, :datetime
    change_column :bookings, :end_time, :datetime
  end
end
