# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'
  get '/streamer', to: 'home#streamer'
  get '/residential', to: 'home#residential'
  get '/commercial', to: 'home#commercial'
  get '/quote', to: 'home#quote'
  get '/index', to: 'home#index'
  post '/create_quotes' =>'quotes#create'
  post '/create_leads' => 'leads#create'
  get '/users/:id' , to: 'users#show'
  get '/users/:id/edit', to: 'users#edit', :as => :user
  patch '/users/:id/edit' => 'users#update'
  get '/greetings', to: 'watson#greetings'
  get '/maps/:building_id', to: 'map#load'
  get '/intervention_form/customer/:customer_id', to: 'intervention#getCustomer'
  get '/intervention_form/building/:building_id' , to: 'intervention#getBuilding'
  get '/intervention_form/battery/:battery_id', to: 'intervention#getBattery'
  get '/intervention_form/column/:column_id', to: 'intervention#getColumn'
  post '/intervention_form/submit' => 'intervention#submit'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
