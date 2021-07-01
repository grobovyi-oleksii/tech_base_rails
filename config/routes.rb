Rails.application.routes.draw do
  resources :trains do
    resources :carriages, shallow: true
    resources :tickets, shallow: true
  end
  resources :railway_stations do
    member do
      post :update_position
      post :update_datetime
    end
  end
  resources :routes
  resource :search, only: %i[show new edit] do
    post '/', to: 'searches#search'
  end

  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
