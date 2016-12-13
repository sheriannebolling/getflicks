Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :sessions

  resources :movies do
    resources :favorites, only: [:create]
  end

  resources :favorites, except: [:create]

  root 'movies#index'
end
