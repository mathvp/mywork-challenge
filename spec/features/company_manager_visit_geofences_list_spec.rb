require 'rails_helper'

feature 'Company Manager visit Geofences list' do
  scenario 'successfully' do
    visit all_geofences_path
    expect(page).to have_css('h1', text: 'Geofences')
  end

  scenario 'and sees a list of Geofences' do
    Geofence.create(description: 'mywork', latitude: -22.9532,
                    longitude: -46.5423, radius: 2)
    Geofence.create(description: 'ourwork', latitude: -12.3456,
                    longitude: -67.8910, radius: 1)

    visit all_geofences_path

    expect(page).to have_content('mywork')
    expect(page).to have_content('-22.9532')
    expect(page).to have_content('-46.5423')
    expect(page).to have_content('2 km')
    expect(page).to have_content('ourwork')
    expect(page).to have_content('-12.3456')
    expect(page).to have_content('-67.8910')
    expect(page).to have_content('1 km')
  end

  scenario 'and cannot see any Geofence' do
    visit all_geofences_path
    expect(page).to have_content('Nothing found')
  end
end
