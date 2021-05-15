Rails.application.routes.draw do
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  

  namespace :admin do
    resources :users
  end

  root to: 'quests#index'
  resources :quests do 
    resources :answers
    get 'quests/answered' => 'quests#answered'
    get 'quests/unanswered' => 'quests#unanswered'
  end 

  
end
