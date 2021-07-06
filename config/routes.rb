Rails.application.routes.draw do
  devise_for :users

  resource :search, only: %i[show new edit] do
    post '/', to: 'searches#search'
  end

  resources :trains do
    resources :tickets, only: %i[new create]
  end

  resources :tickets, only: %i[index show destroy]

  namespace :admin do
    resources :trains do
      resources :carriages, shallow: true
    end
    resources :tickets, only: %i[index show destroy ]
    resources :railway_stations do
      member do
        post :update_position
        post :update_datetime
      end
    end
    resources :routes
    resource :welcomes
  end

  root 'searches#show'

end
