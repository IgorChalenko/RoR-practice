# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  get '/pages', to: 'pages#index'
  get '/registration', to: 'users#new'
  post '/registration', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/password_reset', to: 'password_reset#new'
  post '/password_reset', to: 'password_reset#create'
  get 'password_reset/edit', to: 'password_reset#edit'
  patch 'password_reset/update', to: 'password_reset#update'
end
