Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items, only: [:show, :new, :create, :index, :edit, :update] do
    resources :shares, only: [:index,:new, :create, :update]
  end

  resources :places

  resources :friendships
end
