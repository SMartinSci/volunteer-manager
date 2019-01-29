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

  get 'projects/next_project' => 'projects#next_project'


    resources :roles, only: [:show, :index, :new, :create, :update, :destroy], :shallow => true do
      resources :tasks
    end

    resources :projects, only: [:show, :new, :index, :create, :edit, :update, :destroy], :shallow => true do
      resources :roles 
    end

    resources :users, only: [:show, :new, :create], :shallow => true do
      resources :roles 
    end
 
   resources :tasks, only: [:show, :index, :new, :create, :update, :destroy]

    get '/signup' => 'users#new'
    post '/signup' => 'users#create'
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout'  => 'sessions#destroy'
    

    get '/auth/facebook/callback' => 'sessions#facebook'

end
