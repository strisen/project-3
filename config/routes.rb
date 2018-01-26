Rails.application.routes.draw do

  get 'charges/new'

  get 'charges/create'

  # get 'pages/home'
  root 'pages#home'

  # get 'pages/about'
  get '/about', to: 'pages#about'

  # get 'pages/marketplace'
  get '/marketplace', to: 'pages#marketplace'

  # get 'pages/login'
  # get '/login', to: 'pages#login'
  resources :products

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

  Rails.application.routes.draw do
    resources :charges, only: [:new, :create]
    resources :posts
    root to: 'posts#index'
  end

  get 'thanks', to: 'charges#thanks', as: 'thanks'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
