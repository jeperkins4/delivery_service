#require 'sidekiq/web'
Rails.application.routes.draw do
  # Serve websocket cable requests in-process
  root to: 'welcome#index'
  mount ActionCable.server => "/cable"

  authenticate :user, lambda {|u| u.has_role? :admin } do
  #  mount Sidekiq::Web => '/sidekiq'
  end

  resources :franchises do
    get :autocomplete_franchise_location, on: :collection
  end
  resources :orders
  resources :drivers
  resources :places do
    get :autocomplete_place_name, on: :collection
    resources :menus do
      resources :items do
        member do
          put :order
        end
      end
    end
  end

  devise_for :users
  resources :users
end
