require 'rails_helper'

feature 'Employee visits Timetracks list' do
  scenario 'successfully' do
    visit all_timetracks_path

    expect(page).to have_css('h1', text: 'Timetracks')
  end

  scenario 'and sees Timetracks list' do
    geofence_a = create(:geofence, latitude: 40.712776, longitude: -74.005974)
    geofence_b = create(:geofence, latitude: 56.461430, longitude: -2.968110)

    Timetrack.create!(geofence: geofence_a, user: 'Matheus',
                      latitude: 40.712905, longitude: -74.003691)
    Timetrack.create!(geofence: geofence_b, user: 'José',
                      latitude: 56.462353, longitude: -2.970693)

    visit all_timetracks_path

    expect(page).to have_content('Matheus')
    expect(page).to have_content('40.712905')
    expect(page).to have_content('-74.003691')
    expect(page).to have_content('José')
    expect(page).to have_content('56.462353')
    expect(page).to have_content('-2.970693')
  end
end