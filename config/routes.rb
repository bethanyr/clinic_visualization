Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users

  root 'home#index'
  
  resources :home
  resources :patients

  get 'flowchart', to: 'flowcharts#index'
  get '/flowchart/data', to: 'flowcharts#data'
  get '/flowchart/diabetes', to: 'flowcharts#diabetes'
end
