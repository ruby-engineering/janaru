Rails.application.routes.draw do
  root "home#index"

  namespace :administration do
    resources :tags
    resources :categories
    resources :articles do
      get :publish, on: :member
      get :unpublish, on: :member
    end
  end

  resources :subscribers, only: [:new, :create] 
  resources :messages, only: [:new, :create]
  resources :articles, only: [:show, :index]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_for :users
end
