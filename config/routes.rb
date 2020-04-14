Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  get :quit, to: 'sessions#exit'

  resources :tests do
    resources :questions, shallow: true, except: [:index] do
      resources :answers, shallow: true
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :users, only: %i[create]
  resources :sessions, only: %i[create]

end
