class Spaceship < ApplicationRecord
  # Settings for PG_SEARCH gem
  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [:name, :description],
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
  validates :min_duration, presence: true

  geocoded_by :region
  after_validation :geocode, if: :will_save_change_to_region?
end
