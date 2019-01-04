Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast, only: [:index]
      resources :gifs, only: [:index]
    end
  end
end
