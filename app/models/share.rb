class Share < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates_uniqueness_of :user_id, :scope => :item_id
  validates :rating, inclusion: { in: [nil, 0, 1, 2, 3, 4],
    message: "%{value} is not a valid rating (should be between 0 and 4)" }
end
