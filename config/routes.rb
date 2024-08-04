Rails.application.routes.draw do
namespace :administration do
  resources :tags do

end
endnamespace :administration do
  resources :categories do

end
endresources :subscribers, only: [:new, :create] do

endresources :messages, only: [:new, :create] do

endresources :articles, only: [:show, :index] do

endnamespace :administration do
 resources :articles do
  get :publish, on: :member
  get :unpublish, on: :member

end
end
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
