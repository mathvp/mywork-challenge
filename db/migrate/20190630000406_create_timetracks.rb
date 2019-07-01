class CreateTimetracks < ActiveRecord::Migration[5.2]
  def change
    create_table :timetracks do |t|
      t.string :user
      t.string :comment
      t.decimal :latitude
      t.decimal :longitude
      t.references :geofence, foreign_key: true

      t.timestamps
    end
  end
end
