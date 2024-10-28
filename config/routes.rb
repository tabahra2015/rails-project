Rails.application.routes.draw do
  resources :categories
  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :posts do
    resources :comments, only: [:new, :create]
  end
  
  resources :events do
    resources :comments, only: [:new, :create]
  end
  # Render dynamic PWA files from app/views/pwa/*
  #get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  #get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  #get '/patients/:id', to: 'patients#show'
  resources :patients , only: [:index, :show]
  resolve("Patients") { route_for(:patients) }
  # Defines the root path route ("/")
  # root "posts#index"
end
