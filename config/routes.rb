Rails.application.routes.draw do

  get 'bookings/create'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }

  devise_scope :user do
    get "/user/:id" => 'registrations#show'
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items, only: [:show, :new, :create, :index, :edit, :update] do
    resources :shares, only: [:new, :create, :update]
    resources :bookings, only: [:create]
  end

  resources :shares, only: [:index]


  resources :places

  resources :friendships

  resources :products, only: [] do
    member do
      post :upvote
    end
  end

  JsRoutes.setup do |config|
    config.include = [
      /^upvote_product$/
    ]
  end

end
