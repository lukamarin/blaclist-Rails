Rails.application.routes.draw do
  namespace :admin do
    get '/', to: 'main#index', as: :root
    resources :feedly_articles
    resources :feedly_sources
    resources :interests
    post '/interests/update', to: 'interests#update', as: :update_interests
  end

  get '/login', to: 'session#new', as: :login
  post '/login', to: 'session#create', as: :sign_in
  get '/logout', to: 'session#destroy', as: :logout

  namespace :api do
    namespace :v1 do
      post 'login', to: 'session#sign_in', as: :login
      post 'sign_up', to: 'session#sign_up', as: :sign_up

      get '/interests', to: 'interests#index', as: :interests
      post '/user/interests', to: 'user#update_interests', as: :update_interests
      get '/feed', to: 'homefeed#index', as: :homefeed
    end
  end
end
