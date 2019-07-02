require 'rails_helper'

feature 'Company Manager removes Geofence' do
  scenario 'successfully' do
    geofence = create(:geofence)

    visit all_geofences_path
    find("#delete-geo-#{geofence.id}").click

    expect(page).to have_content('Geofence successfully removed')
    expect(Geofence.all.size).to eq(0)
  end
end
