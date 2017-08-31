Rails.application.routes.draw do
  root to: 'home#home'
 resources :cities do
  resources :posts
end
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }


  get "/users/:id", to: "users#show", as: "user_profile"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
