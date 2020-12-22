Rails.application.routes.draw do
  resources :ingredients

  get "recipes/sort_low_high", to: "recipes#sort_low_high", as: "sort_low_high"
  resources :recipes
  
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

