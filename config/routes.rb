# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get 'microposts/new'
  post 'microposts/new', to: 'microposts#create'
  get 'microposts/index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
