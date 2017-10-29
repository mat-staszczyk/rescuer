Rails.application.routes.draw do
  root 'pages#home'
  resources :help_requests
  devise_for :users

  get '/help_requests/activate/:id',
    to: 'help_requests#activate', as: 'activate_help_request'
  get '/help_requests/cancel/:id',
    to: 'help_requests#cancel', as: 'cancel_help_request'
  get '/help_requests/complete/:id',
    to: 'help_requests#complete', as: 'complete_help_request'
  get '/help_requests/follow/:id',
    to: 'help_requests#follow', as: 'follow_help_request'
end
