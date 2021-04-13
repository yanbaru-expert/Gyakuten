Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root to: "static_pages#home"
  get "design", to: "static_pages#design", as: :static_pages
  post "/design_contact", to: "contacts#create"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :static_pages, only: :home
  resource :my_pages, only: :show
  resources :texts, only: [:index, :show] do
    resource :read_texts, only: [:create, :destroy]
  end
  resources :movies, only: [:index] do
    resource :watched_movies, only: [:create, :destroy]
  end
  resources :challenges, only: [:index, :show] do
    resource :complete_challenges, only: [:create, :destroy]
  end
  resources :lines, only: [:index, :show]
  resources :questions, only: [:index, :show, :create, :edit, :update] do
    resource :solutions, only: [:create]
  end
end
