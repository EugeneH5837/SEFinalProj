Rails.application.routes.draw do
  resources :role_specs
  resources :role_specific_links
  resources :global_links
  resources :mylinks
  root to: 'visitors#index'
  devise_for :users
  resources :users do 
    resources :mylinks, controller: "users/mylinks"
  end
  resources :users do 
    resources :role_specific_links, controller: "users/role_specific_links"
  end
end
