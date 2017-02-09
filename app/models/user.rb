class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :shares, dependent: :destroy
  has_one :place, dependent: :destroy
  has_many :items

  # FOR FRIENDSHIPS
  has_many :friendships, dependent: :destroy
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  # FOR AVATAR
  mount_uploader :photo, PhotoUploader

  # FOR ITEM VOTABILITY
  acts_as_voter

  def first_and_last_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
