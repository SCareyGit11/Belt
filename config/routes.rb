Rails.application.routes.draw do
  get '/' => 'sessions#welcome'

  post 'adds' => 'adds#create'

######## SONGS ##########
  get 'songs/index'

  get 'songs/new'

  
  get 'songs/:id' => 'songs#show'


  post 'songs' => 'songs#create'

######## USERS ###########
  get 'users/new' => 'users#new'
  get 'users/show'
  get 'users/:id' => 'users#show'


  post 'users' => 'users#create'

###### SESSIONS #########

get 'sessions' => 'sessions#new'
post 'sessions' => 'sessions#create'
delete 'sessions' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
