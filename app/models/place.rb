class Place < ApplicationRecord
  belongs_to :user

  # FOR GEOCODING
  geocoded_by :postcode
  after_validation :geocode, if: :address_changed?

end
