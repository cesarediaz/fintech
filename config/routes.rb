Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :sessions, only: [:create] do
        get 'create', on: :collection
      end
    end
  end
  root to: 'home#index'
end
