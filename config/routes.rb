Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:edit, :update, :index, :destroy, :show]
  get '/home/about' => 'users#about', as: 'home_about'

  root 'users#home'


end