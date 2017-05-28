Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',    
    registrations: 'users/registrations'
  }

  root 'home#index'
  
  get 'home/index'

  get 'home/new', to: 'home#new'

  # get 'home/:id', to: 'home#show'

  post 'home/create', to: 'home#create'

  get 'home/:id/edit', to: 'home#edit'

  patch 'home/:id/update', to: 'home#update'

  delete 'home/:id/destroy', to: 'home#destroy'
  
end
