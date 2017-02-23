class Booking < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates :start_time, :end_time, overlap: true
end
