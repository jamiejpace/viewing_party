class Party < ApplicationRecord
  has_many :attendees
  has_many :users, through: :attendees

  validates :date, presence: true
  validates :time, presence: true
  validates :movie_title, presence: true
  validates :movie_runtime, presence: true
end
