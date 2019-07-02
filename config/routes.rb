Rails.application.routes.draw do
  root to: 'index#index'

  resources :geofences, only: %i(show new create edit update destroy) do
    get 'all', on: :collection
  end

  resources :timetracks, only: %i(show new create) do
    get 'all', on: :collection
    get 'location', on: :collection
  end

  post 'timetracks/register-location', to: 'timetracks#new'
end
