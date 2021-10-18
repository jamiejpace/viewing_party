class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :party

  validates :role, presence: true

  enum role: [:guest, :host]
end
