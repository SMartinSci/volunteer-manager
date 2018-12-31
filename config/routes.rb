Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: 'welcome#index'
    
    resources :users
    resources :projects do
      resources :roles do
        resources :tasks
    end
  end

  resources :roles, only: [:index]
  resources :projects, only: [:index]
  resources :tasks, only: [:index, :create] 
  
    get '/signup' => 'users#new'
    post '/signup' => 'users#create'
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete '/logout'  => 'sessions#destroy'

    get '/auth/facebook/callback' => 'sessions#facebook'

end
