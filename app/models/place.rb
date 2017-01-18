class Place < ApplicationRecord
  belongs_to :user
  has_many :items

  # FOR GEOCODING
  geocoded_by :postcode
  after_validation :geocode, if: :address_changed?

end
