Rails.application.routes.draw do

  resources :help_requests



  devise_for :users
  get 'pages/home'

  root 'pages#home'


end
