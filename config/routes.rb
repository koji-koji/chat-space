Rails.application.routes.draw do
  devise_for :users
  root 'chatgroups#index'
  resources :user_search, only: :index
  resources :chatgroups, except: :show do
    resources :comments, only: [:index, :create]
  end
end
