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
  get '/poll/new', to: 'polls#new'
  post '/poll/new', to: 'polls#create'
  get '/poll/:id', to: 'polls#show', as: 'poll'
  delete '/poll/:id', to: 'polls#destroy'
  get '/poll/:id/edit', to: 'polls#edit', as: 'poll_edit'
  patch '/poll/:id', to: 'polls#update'

  resources :polls, only: %i[index]
end
