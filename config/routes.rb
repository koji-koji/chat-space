Rails.application.routes.draw do
  devise_for :users
  root 'chatgroups#new'
  resources :user_search, only: :index
  resources :chatgroups, except: [:index, :show] do
    resources :comments, only: [:index, :create]
  end
end
