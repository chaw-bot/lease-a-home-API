Rails.application.routes.draw do
  resources :leases
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/users', to: 'users#index'         
end
