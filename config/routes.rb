Rails.application.routes.draw do
  root to: 'index#index'

  resources :geofences, only: %i(show new create edit update) do
    get 'all', on: :collection
  end
end
