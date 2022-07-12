Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/musics/lyrics', to: 'musics#fetch_lyrics'
      post '/musics/chords', to: 'musics#fetch_chords'
    end
  end

  resources :musics
  resources :repertories, except: [:index]

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
