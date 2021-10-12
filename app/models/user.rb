class User < ApplicationRecord
  has_many :attendees
  has_many :parties, through: :attendees
  # has_many :friends, foreign_key: :user_id, class_name: "Friendship"
  # has_many :inverse_friends, through: :friends
  # has_many :inverse_friends, foreign_key: :friend_id, class_name: "Friendship"
  # has_many :friends, through: :inverse_friends
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  validates :email, uniqueness: true, presence: true
  
  has_secure_password
end
