class Geofence < ApplicationRecord
  validates :description, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :radius, presence: true
end
