# frozen_string_literal: true

Rails.application.routes.draw do
  root   'static_pages#home'
  post   'microposts/new',    to: 'microposts#create'
  get    '/login',            to: 'sessions#new'
  get    '/signup',           to: 'users#create'
  post   '/signup',           to: 'users#create'
  post   '/login',            to: 'sessions#create'
  delete '/logout',           to: 'sessions#destroy'


  resources :users
  resources :microposts
end
