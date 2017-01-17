class Item < ApplicationRecord
  has_many :shares
  belongs_to :user
  mount_uploader :photo, PhotoUploader
end
