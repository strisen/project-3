Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :charges, only: [:create, :index]
  # root to: 'posts#index'

  # get 'charges/new'
  #
  # get 'charges/create'

  # get 'pages/home'
  root 'pages#home'

  # get 'pages/about'
  get '/about', to: 'pages#about'

  # get 'pages/marketplace'
  # get '/marketplace', to: 'pages#marketplace'

  # get 'pages/login'
  # get '/login', to: 'pages#login'
  resources :products

  resources :purchases

  resources :approvals
  # post 'pages/approved'
  # post '/approved', to: 'pages#approved'
  # post 'pages/rejected'
  # post '/rejected', to: 'pages#rejected'

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


  # Rails.application.routes.draw do

  # end

  # get 'thanks', to: 'charges#thanks', as: 'thanks'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
