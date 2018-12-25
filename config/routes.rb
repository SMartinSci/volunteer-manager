Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: 'welcome#index'
    
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete '/logout'  => 'sessions#destroy'

end
