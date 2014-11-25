Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users

  root 'home#index'
  
  resources :home
  resources :patients
  resources :notes


  get 'dashboard', to: 'dashboards#index'
  get '/dashboard/data', to: 'dashboards#data'
  get '/dashboard/diabetes', to: 'dashboards#diabetes'
  get '/dashboard/vitals', to: 'dashboards#vitals'
  get '/dashboard/kidney', to: 'dashboards#kidney'
  get '/dashboard/asthma', to: 'dashboards#asthma'
  get '/dashboard/anticoagulation', to: 'dashboards#anticoagulation'
  get 'visit', to: 'visits#index'
  get 'medical_history', to: 'medical_histories#index'
  get 'medication', to: 'medications#index'
  get 'instructions', to: 'patient_instructions#index'
  get 'interaction', to: 'interactions#index'
end
