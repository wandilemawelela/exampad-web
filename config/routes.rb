Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :quizzes do
    member do
      get 'start'
    end
    resources :questions do
      post 'answer', on: :member
      resources :answers, only: %i[new create edit update destroy]
    end
  end

  root 'home#index'
end
