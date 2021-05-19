# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  get '/pages', to: 'pages#index'
  get '/registration', to: 'pages#new'
  post '/registration', to: 'pages#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
