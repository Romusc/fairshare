class Item < ApplicationRecord
  has_many :shares
  mount_uploader :photo, PhotoUploader
end
