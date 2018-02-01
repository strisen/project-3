Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :charges, only: [:create, :index]

  root 'pages#home'

  get '/about', to: 'pages#about'

  resources :products

  resources :purchases

  resources :approvals

  # devise routes
  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      password: 'secret',
      registration: '',
      sign_up: 'register'
    }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
