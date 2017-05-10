Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :chatgroups, except: [:index ,:show] do
    resources :comments, only: [:index ,:post]
  end
end
