class Booking < ApplicationRecord
  belongs_to :court
  belongs_to :user

  validates :date, :beginning_time, :ending_time, :court_id, :user_id, presence: true
end
