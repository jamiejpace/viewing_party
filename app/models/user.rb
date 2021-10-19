class User < ApplicationRecord
  has_many :attendees, dependent: :destroy
  has_many :parties, through: :attendees
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  validates :email, uniqueness: true, presence: true, email: true

  has_secure_password

  def current_friends
    friends.distinct
  end

end
