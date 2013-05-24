Skeletor::Application.routes.draw do
  resources :artists


  resources :festivals do
    resources :artists
  end


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end