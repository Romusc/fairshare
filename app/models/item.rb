class Item < ApplicationRecord
  has_many :shares
  belongs_to :user
  belongs_to :place
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true
  validates :value, presence: true
  validates :photo, presence: true
end
