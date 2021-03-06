Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus,
             path_names: {sign_in: :login, sign_out: :logout},
             controllers: {sessions: 'users/sessions'} # to add customization to devise sessions controller

  resources :tests, only: :index do
    post :start, on: :member

  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  resources :badges, only: %i[index]
  get :badges_all, to: 'badges#all'

  namespace :admin do

    resources :tests do
      resources :questions, shallow: true, except: [:index] do
        resources :answers, shallow: true, except: [:index]
      end

      patch :update_inline, on: :member
    end

    resources :badges, only: %i[index new create destroy]
    resources :gists, only: %i[index]
  end

  resources :feedbacks, only: %i[new create]

end
