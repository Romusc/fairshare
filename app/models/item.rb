class Item < ApplicationRecord
  has_many :shares
  belongs_to :user
  belongs_to :place
  mount_uploader :photo, PhotoUploader
end
