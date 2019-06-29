class CreateGeofences < ActiveRecord::Migration[5.2]
  def change
    create_table :geofences do |t|
      t.string :description
      t.decimal :latitude
      t.decimal :longitude
      t.decimal :radius

      t.timestamps
    end
  end
end
