Rails.application.routes.draw do
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :destroy, :index]
      resources :sessions, only: [:create]
      resources :splayds, only: [:index]
      resources :jobs, only: [:index, :show, :destroy, :create]
      resources :logs, only: [:show]
    end
  end
end
