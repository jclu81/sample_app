Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/room/create', to: 'rooms#new'
  post '/room/create', to: 'rooms#create'

  resources :users do
    member do
      get :rooms
    end
  end
  resources :rooms do
    member do
      get :users
    end
  end
  resources :relationships, only: [:create, :destroy]

  namespace 'api' do
    namespace 'v1' do
      get '/rooms', to: 'rooms#index'
      get '/rooms/:id', to: 'rooms#show'
      patch '/rooms/:id', to: 'rooms#update'
      delete '/rooms/:id', to: 'rooms#destroy'
      resource :rooms

      get '/users', to: 'users#index'
      get '/users/:id', to: 'users#show'
      patch '/users/:id', to: 'users#update'
      delete '/users/:id', to: 'users#destroy'
      resource :users

      resource :relationships
    end
  end

end
