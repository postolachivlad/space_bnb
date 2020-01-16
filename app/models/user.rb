class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :spaceships
  has_many :bookings
  accepts_nested_attributes_for :bookings # this line is needed for simple_forms for editing bookings
end
