class User < ApplicationRecord
  has_many :attendees
  has_many :parties, through: :attendees
  has_many :friends, foreign_key: :user_id, class_name: "Friendship"
  has_many :inverse_friends, through: :friends
  has_many :inverse_friends, foreign_key: :friend_id, class_name: "Friendship"
  has_many :friends, through: :inverse_friends
end
