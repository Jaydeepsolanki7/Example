Rails.application.routes.draw do
  get 'home/display_all' ,to: "home#display_all"
  get 'uploads/index'
  devise_for :users
  root "home#index"

  resources :users do
    resources :uploads
  end
  
  resources :uploads do
    resources :comments 
  end
end
