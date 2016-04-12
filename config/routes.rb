Rails.application.routes.draw do
  resources :franchises
  resources :orders
  resources :drivers
  resources :places do
    resources :menus do
      resources :items do
        member do
          put :order
        end
      end
    end
  end
  resources :locations

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root to: 'places#index'
  devise_for :users
  resources :users
end
