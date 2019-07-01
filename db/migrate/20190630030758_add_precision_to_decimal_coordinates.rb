class AddPrecisionToDecimalCoordinates < ActiveRecord::Migration[5.2]
  def change
    change_column(:geofences, :latitude, :decimal, { precision: 10, scale: 6 })
    change_column(:geofences, :longitude, :decimal, { precision: 10, scale: 6 })
  end
end
