require 'rails_helper'

RSpec.describe Timetrack, type: :model do
  it 'is valid with valid attributes' do
    geofence = create(:geofence, latitude: 40.712776, longitude: -74.005974)
    timetrack = Timetrack.new(geofence: geofence, user: 'user_email@email.com',
                              latitude: 40.712905, longitude: -74.003691)

    expect(timetrack).to be_valid
  end

  it 'is not valid without user' do
    geofence = create(:geofence, latitude: 40.712776, longitude: -74.005974)
    timetrack = Timetrack.new(geofence: geofence, latitude: 40.712905,
                              longitude: -74.003691)

    expect(timetrack).not_to be_valid
  end

  it 'is not valid without latitude' do
    geofence = create(:geofence, latitude: 40.712776, longitude: -74.005974)
    timetrack = Timetrack.new(geofence: geofence, user: 'user_email@email.com',
                              longitude: -74.003691)

    expect(timetrack).not_to be_valid
  end

  it 'is not valid without longitude' do
    geofence = create(:geofence, latitude: 40.712776, longitude: -74.005974)
    timetrack = Timetrack.new(geofence: geofence, user: 'user_email@email.com',
                              latitude: 40.712905)

    expect(timetrack).not_to be_valid
  end

  it 'is valid inside geofence' do
    geofence = create(:geofence, latitude: -22.954380, longitude: -46.546660,
                                 radius: 1)
    timetrack = Timetrack.new(geofence: geofence, user: 'user_email@email.com',
                              latitude: -22.954160, longitude: -46.543990)

    expect(timetrack).to be_valid
  end

  it 'is not valid outside geofence' do
    geofence = create(:geofence, latitude: -22.954380, longitude: -46.543990,
                                 radius: 1)
    timetrack = Timetrack.new(geofence: geofence, user: 'user_email@email.com',
                              latitude: 40.712905, longitude: -74.003691)

    expect(timetrack).not_to be_valid
  end
end
