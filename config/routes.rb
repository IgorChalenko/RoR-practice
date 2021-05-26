# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  get '/pages', to: 'pages#index'
  get '/registration', to: 'users#new'
  post '/registration', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
