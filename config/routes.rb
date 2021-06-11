# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  get '/pages', to: 'pages#index'
  
  get '/registration', to: 'users#new'
  post '/registration', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '/reset_password', to: 'reset_password#new'
  post '/reset_password', to: 'reset_password#create'
  get '/reset_password/edit', to: 'reset_password#edit'
  patch '/reset_password/update', to: 'reset_password#update'

  
  # get '/poll/invite/:id/find', to: 'polls#invite', as: 'find'
  # post '/poll/invite/:id', to: 'polls#invite_user', as: 'invite'

  resources :polls do 
    resources :invites, only: [:new, :create]
    resources :votes, only: [:update]
  end

 

end
