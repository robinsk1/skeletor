Skeletor::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :artists

  resources :festivals do
    #resources :editions do
      resources :artists
    #end
  end

  authenticated :user do
    root :to => 'festivals#index'
  end
  root :to => "festivals#index"
  devise_for :users
  resources :users


end