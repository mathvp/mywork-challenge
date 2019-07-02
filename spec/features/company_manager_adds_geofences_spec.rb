require 'rails_helper'

feature 'Company Manager adds New Geofence' do
  scenario 'Successfully' do
    visit all_geofences_path
    click_on 'Add new Geofence'

    fill_in 'Description', with: 'Work place'
    fill_in 'Latitude', with: 37.773972
    fill_in 'Longitude', with: -122.431297
    fill_in 'Radius', with: 1
    click_on 'Submit'

    expect(page).to have_content('Geofence successfully saved!')
    expect(page).to have_content('Work place')
    expect(page).to have_content('37.773972')
    expect(page).to have_content('-122.431297')
    expect(page).to have_content('1 mt')
  end

  scenario 'but all fields are required' do
    visit new_geofence_path
    click_on 'Submit'

    expect(page).to have_content('Description can\'t be blank')
    expect(page).to have_content('Latitude can\'t be blank')
    expect(page).to have_content('Description can\'t be blank')
    expect(page).to have_content('Radius can\'t be blank')
  end
end
