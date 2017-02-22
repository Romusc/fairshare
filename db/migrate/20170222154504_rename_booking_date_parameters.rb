class RenameBookingDateParameters < ActiveRecord::Migration[5.0]
  def change
    rename_column :bookings, :start_date, :start_time
    rename_column :bookings, :end_date, :end_time
  end
end
