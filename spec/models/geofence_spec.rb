require 'rails_helper'

RSpec.describe Geofence, type: :model do
  it 'is valid with valid attributes' do
    geofence = Geofence.new(description: 'mywork', latitude: -22.9532,
                            longitude: -46.5423, radius: 2)
    expect(geofence).to be_valid
  end

  it 'is not valid without description' do
    geofence = Geofence.new(latitude: -22.9532, longitude: -46.5423, radius: 2)
    expect(geofence).not_to be_valid
  end

  it 'is not valid without latitude' do
    geofence = Geofence.new(description: 'mywork', longitude: -46.5423,
                            radius: 2)
    expect(geofence).not_to be_valid
  end

  it 'is not valid without longitude' do
    geofence = Geofence.new(description: 'mywork', latitude: -22.9532,
                            radius: 2)
    expect(geofence).not_to be_valid
  end

  it 'is not valid without radius' do
    geofence = Geofence.new(description: 'mywork', latitude: -22.9532,
                            longitude: -46.5423)
    expect(geofence).not_to be_valid
  end
end
