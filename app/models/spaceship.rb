class Spaceship < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :reviews
  has_many :bookings

  validates :name, presence: true,
                   uniqueness: true
  validates :description, presence: true
  validates :min_duration, presence: true

  geocoded_by :region
  after_validation :geocode, if: :will_save_change_to_region?
end
