Rails.application.routes.draw do
  devise_for :users
  root 'chatgroups#new'
  resources :chatgroups, except: [:index, :show] do
    resources :comments, only: [:index, :create]
  end
end
