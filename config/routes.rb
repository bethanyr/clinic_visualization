Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users

  root 'home#index'
  
  resources :home
  resources :patients
  resources :notes


  get 'flowchart', to: 'flowcharts#index'
  get '/flowchart/data', to: 'flowcharts#data'
  get '/flowchart/diabetes', to: 'flowcharts#diabetes'
  get '/flowchart/vitals', to: 'flowcharts#vitals'
  get '/flowchart/kidney', to: 'flowcharts#kidney'
  get '/flowchart/asthma', to: 'flowcharts#asthma'
  get '/flowchart/anticoagulation', to: 'flowcharts#anticoagulation'
  get 'visit', to: 'visits#index'
  get 'medical_history', to: 'medical_histories#index'
  get 'medication', to: 'medications#index'
  get 'instructions', to: 'patient_instructions#index'
  get 'interaction', to: 'interactions#index'
end
