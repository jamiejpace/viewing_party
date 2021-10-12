class Party < ApplicationRecord
  has_many :attendees
  has_many :users, through: :attendees
end
