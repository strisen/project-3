Rails.application.routes.draw do
  # get 'pages/home'
  root 'pages#home'

  # get 'pages/about'
  get '/about', to: 'pages#about'

  # get 'pages/marketplace'
  get '/marketplace', to: 'pages#marketplace'

  # get 'pages/login'
  get '/login', to: 'pages#login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
