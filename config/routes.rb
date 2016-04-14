Rails.application.routes.draw do
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

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root to: 'welcome#index'
  devise_for :users
  resources :users
end
