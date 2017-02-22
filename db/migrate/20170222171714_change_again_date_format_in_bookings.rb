class ChangeAgainDateFormatInBookings < ActiveRecord::Migration[5.0]
  def change
    change_column :bookings, :start_time, :date
    change_column :bookings, :end_time, :date
  end
end
