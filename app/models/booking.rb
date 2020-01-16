class Booking < ApplicationRecord
  # the following line basically assigns an integer to the respective statuses.
  # This helps to keep the database fast
  enum status: { requested: 0, accepted: 1, declined: 2 }
  belongs_to :user
  belongs_to :spaceship
  validates  :start_date, presence: true
  validates  :end_date, presence: true#, numericality: { greater_than: :start_date }
end
