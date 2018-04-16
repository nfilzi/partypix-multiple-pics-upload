Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :rooms, only: [:show] do
    resources :pictures, only: [:new, :create]
  end

  resources :pictures, only: [:destroy]
end
