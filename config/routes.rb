Rails.application.routes.draw do
  
  root 'tests#index'

  devise_for :users, controllers: { sessions: 'users/sessions' },
                     path: :gurus, 
                     path_names: { sign_in: :login, sign_out: :logout }
  
  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  get 'badges', to: 'user_badges#index'
  resources :feedbacks, only: %i[new create]

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index
    resources :badges
  end
end

