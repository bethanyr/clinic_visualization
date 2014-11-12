Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users

  root 'home#index'
  
  resources :home
  resources :patients

  get 'flowchart', to: 'flowcharts#index'
  get '/flowchart/data', to: 'flowcharts#data'
  get '/flowchart/diabetes', to: 'flowcharts#diabetes'
  get 'visit', to: 'visits#index'
  get 'medical_history', to: 'medical_histories#index'
  get 'medication', to: 'medications#index'
end
