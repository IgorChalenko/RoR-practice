# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  get '/pages', to: 'pages#index'
  get '/pages/registration', to: 'pages#new'
  post '/pages/registration', to: 'pages#create'
end
