class Friendship < ApplicationRecord
  # belongs_to :inverse_friend, class_name: "User"
  # belongs_to :friend, class_name: "User"
  belongs_to :user
  belongs_to :friend, :class_name => "User"
end
