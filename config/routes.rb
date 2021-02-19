Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :videos do
    resources :comments, only: [:index]
    resources :videolikes
  end
  get '/recommendvideos' => 'videos#recommend_videos'
  
  resources :users do
    resources :videos do 
      resources :videolikes
      resources :comments
    end
    resources :subscriptions
  get 'subscribers', to: 'subscriptions#subscribers'
  
  end
  resources :items
  get 'logged_in', to: 'sessions#logged_in'
  delete 'logout', to: 'sessions#logout'
  delete '/users/:user_id/subscriptions', to: 'subscriptions#unsubscribe'
  put '/videos/:video_id/views', to: 'videos#views'
  get '/videos/:video_id/liked_video', to: 'videolikes#liked_video'
  delete '/videos/:video_id/videolikes', to: 'videolikes#delete'
  get '/users/:user_id/checksubscription', to: 'subscriptions#checksubscription'

end 