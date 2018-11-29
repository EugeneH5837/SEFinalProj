Rails.application.routes.draw do
  resources :role_specs
  resources :global_links
  root to: 'visitors#index'
  get '/testing' , to: 'users#edit'
  devise_for :users, controllers: { registrations: "registrations" }, :path_prefix => 'd'
  resources :users do 
    resources :mylinks, controller: "users/mylinks"
  end
  resources :users do 
    resources :role_specific_links, controller: "users/role_specific_links"
  end
end
