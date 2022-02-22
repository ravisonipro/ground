class Stadium < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_and_belongs_to_many :slots

  mount_uploader :picture, PictureUploader
end