Rails.application.routes.draw do

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Heroku Welcome Page



  # ------------------------
  #      AUTHENTICATION      #
  # ------------------------

  get '/', to: 'users#index'

  resources :users do
    collection do

      post '/login', to: 'users#login'

      post '/register', to: 'users#register'

    end
  end

  # get '/users', to: 'users#index'
  #
  # get '/users/:id', to: 'users#show'
  #
  # post '/users', to: 'users#create'
  #
  # delete '/users/:id', to: 'users#delete'
  #
  # put '/users/:id', to: 'users#update'


  # ------------------------
  #      POSTS ROUTES      #
  # ------------------------

  # INDEX ROUTE
  get '/posts', to: 'posts#index'

  # SHOW ROUTE
  get '/posts/:id', to: 'posts#show'

  # CREATE ROUTE
  post '/posts', to: 'posts#create'

  # DELETE ROUTE
  delete '/posts/:id', to: 'posts#delete'

  # UPDATE ROUTE
  put '/posts/:id', to: 'posts#update'


end
