Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/users', to: 'users#index'

  get '/users/:id', to: 'users#show'

  post '/users', to: 'users#create'

  delete '/users/:id', to: 'users#delete'

  put '/users/:id', to: 'users#update'

  # ------------------------
  #      POSTS ROUTES      #
  # ------------------------

  # INDEX ROUTE
  get '/posts', to: 'posts#index'

  # SHOW ROUTE
  get '/posts/:id', to: 'posts#show'

  # CREATE ROUTE
  post '/posts', to: 'posts#create'

end
