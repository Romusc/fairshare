class Item < ApplicationRecord
  has_many :shares
  belongs_to :user
  belongs_to :place

  validates :name, presence: true
  validates :value, presence: true
  validates :photo, presence: true

  # FOR ITEM PICTURE
  mount_uploader :photo, PhotoUploader

  # FOR BEING VOTABLE BY USER
  acts_as_votable

  # CONSTANT TO ACCESS LATER
  CATEGORIES = ['Sports', 'Music', 'Outdoor', 'Other', 'Tech', 'Games', 'Books']

  def self.search(category)
    @items = Item.where("category LIKE ?", "%#{category}%")
  end
end
