Rails.application.routes.draw do

  resources :help_requests

  get '/help_requests/activate/:id', to: 'help_requests#activate', as: 'activate_help_request'
  get '/help_requests/cancel/:id', to: 'help_requests#cancel', as: 'cancel_help_request'

  devise_for :users
  get 'pages/home'

  root 'pages#home'


end
