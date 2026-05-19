Rails.application.routes.draw do
  devise_for :users

  # Home page
  root "pages#home"

  # Books + nested reviews
  resources :books do
    resources :reviews, only: [:new, :create, :index, :edit, :update, :destroy]
  end

  # My Reviews (user-specific)
  get "my_reviews", to: "reviews#my_reviews", as: :my_reviews

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end


