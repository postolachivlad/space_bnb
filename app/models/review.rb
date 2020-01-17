class Review < ApplicationRecord
  belongs_to :spaceship
  validates  :description, presence: true
  validates  :rating, presence: true, inclusion: 1..5
end
