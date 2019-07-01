class Timetrack < ApplicationRecord
  belongs_to :geofence

  validates :user, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validate :check_placement, :if => :latitude_and_longitude_present?

  private

  def latitude_and_longitude_present?
    true unless latitude.nil? || longitude.nil?
  end

  def check_placement
    distance = Haversine.distance(self.geofence.latitude,
                                  self.geofence.longitude,
                                  self.latitude, self.longitude)

    error_msg = 'Timetracks can only be registered inside Geofence area'
    errors.add(:base, error_msg) unless self.geofence.radius >= distance.to_km

  end
end
