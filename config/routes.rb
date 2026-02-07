Rails.application.routes.draw do
  get "static_pages/about"
  resources :authors, only: [ :index, :show ], param: :name do
    member do
      patch :show # Required for infinite scroll
    end
  end
  resources :posts, only: [ :index, :show ] do
    collection do
      patch :index # Required for infinite scroll
    end
  end
  resources :tags, only: [ :index, :show ], param: :name do
    member do
      patch :show # Required for infinite scroll
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "posts#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
end
