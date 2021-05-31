Rails.application.routes.draw do
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  

  namespace :admin do
    resources :users
    resources :questions
  end

  root to: 'quests#index'
  resources :quests do 
    resources :answers
    member do
      get 'solved' => 'quests#solved'
      get 'unsolved' => 'quests#unsolved'
    end
  end 

  
end
