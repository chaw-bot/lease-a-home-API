Rails.application.routes.draw do
  # resources :leases
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  resources :user do 
    resources :leases
  end
  resources :apartments
  get '/member-data', to: 'members#show'
  get '/users', to: 'users#index'         
end
