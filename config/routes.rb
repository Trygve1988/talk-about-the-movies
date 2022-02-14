Rails.application.routes.draw do
  resources :movies
  resources :searches
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :searches do
    member do
      post :do_searh
    end
  end

  # Defines the root path route ("/")
  root "movies#index"
end
