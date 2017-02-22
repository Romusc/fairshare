class AddUserAndItemReferenceToBookingsAndDeleteReferenceToShare < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :item, foreign_key: true
    add_reference :bookings, :user, foreign_key: true
    remove_reference :bookings, :share
  end
end
