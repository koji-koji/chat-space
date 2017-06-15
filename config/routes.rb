Rails.application.routes.draw do
  devise_for :users
  root 'chatgroups#index'
  resources :chatgroups, except: [:show] do
    resources :comments, only: [:index, :create]
  end
end
