Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: 'welcome#index'
    
    # resources :users do
    #   shallow do
    #     resources :projects do
    #       shallow do
    #       resources :roles do
    #         resources :tasks

  get 'projects/this_year' => 'projects#this_year'

    resources :roles, :shallow => true do
      resources :tasks
    end

    resources :projects, :shallow => true do
      resources :roles 
    end

    resources :users, :shallow => true do
      resources :roles 
    end

  resources :roles, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :projects, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :tasks, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:show, :new, :create]
  
    get '/signup' => 'users#new'
    post '/signup' => 'users#create'
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout'  => 'sessions#destroy'
    

    get '/auth/facebook/callback' => 'sessions#facebook'

end
