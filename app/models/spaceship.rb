class Spaceship < ApplicationRecord
  # Settings for PG_SEARCH gem
  include PgSearch::Model
  pg_search_scope :search_ships,
    against: [:name, :region],
    using: {
      tsearch: { prefix: true }
    }

  # Carrierwave gem settings
  mount_uploader :photo, PhotoUploader

  # DB tables relations
  belongs_to :user
  has_many :reviews
  has_many :bookings

  validates :name, presence: true,
                   uniqueness: true
  validates :description, presence: true
  # validates :min_duration -->commented out because adjustment of Spaceship creation form

  geocoded_by :region
  after_validation :geocode, if: :will_save_change_to_region?
end
