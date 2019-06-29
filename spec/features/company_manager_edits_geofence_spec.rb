require 'rails_helper'

feature 'Company Manager edits Geofence' do
  scenario 'successfully' do
    geofence = Geofence.create!(description: 'my work place',
                                latitude: -64.37333, longitude: 96.60922,
                                radius: 3)
    visit all_geofences_path
    find("#edit-geo-#{geofence.id}").click
    fill_in 'Description', with: 'UpdatedGeofence'
    fill_in 'Latitude', with: 11.11111
    fill_in 'Longitude', with: 22.22222
    fill_in 'Radius', with: 1
    click_on 'Submit'

    expect(page).to have_content('Geofence successfully updated!')
    expect(page).to have_content('UpdatedGeofence')
    expect(page).to have_content('11.11111')
    expect(page).to have_content('22.22222')
    expect(page).to have_content('1 km')
  end
end