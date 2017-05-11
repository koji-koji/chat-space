Rails.application.routes.draw do
  devise_for :users
  root 'comments#index'
  resources :chatgroups, except: [:index, :show] do
    resources :comments, only: [:index, :create]
  end
end
