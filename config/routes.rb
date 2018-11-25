Rails.application.routes.draw do
  resources :role_specs
  resources :global_links
  root to: 'visitors#index'
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users do 
    resources :mylinks, controller: "users/mylinks"
  end
  #get 'create_user' => 'users#create', as: :create_user
  resources :users do 
    resources :role_specific_links, controller: "users/role_specific_links"
  end
end
