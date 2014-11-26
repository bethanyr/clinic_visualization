Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users

  root 'home#index'
  
  resources :home
  resources :patients
  resources :notes
  resources :doctors
  resources :visits
  resources :medical_conditions
  resources :allergies
  resources :lab_tests


  get 'dashboard', to: 'dashboards#index'
  get 'view_dashboard', to: 'dashboards#view_dashboard'
  get '/dashboard/data', to: 'dashboards#data'
  get '/dashboard/diabetes', to: 'dashboards#diabetes'
  get '/dashboard/vitals', to: 'dashboards#vitals'
  get '/dashboard/kidney', to: 'dashboards#kidney'
  get '/dashboard/bronchitis', to: 'dashboards#bronchitis'
  get '/dashboard/anticoagulation', to: 'dashboards#anticoagulation'
  get 'visit', to: 'visits#index'
  get 'medical_history', to: 'medical_histories#index'
  get 'medication', to: 'medications#index'
  get 'instructions', to: 'patient_instructions#index'
  get 'interaction', to: 'interactions#index'

  get "patients_data", to: "patients#index", defaults: {format: :json}
  post "set_current_patient", to: "user_data#update_user", defaults: {format: :json}
end
