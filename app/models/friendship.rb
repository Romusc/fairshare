class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
  validates_uniqueness_of :friend_id, :scope => :friend_id
  validates :user_id, presence: true
  validates :friend_id, presence: true
end
