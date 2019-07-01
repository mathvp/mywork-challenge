class Geofence < ApplicationRecord
  validates :description, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :radius, presence: true

  has_many :timetracks

  def self.check_timetrack_location(timetrack)

    Geofence.all.select do |geofence|
      distance = Haversine.distance(geofence.latitude, geofence.longitude,
                                    timetrack.latitude, timetrack.longitude)
      geofence.radius >= distance.to_km
    end
  end
end
