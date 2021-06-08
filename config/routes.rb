Rails.application.routes.draw do
  get 'text_images/index'
  get 'text_images/create'
  get 'text_images/destroy'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root to: "static_pages#home"

  get "design", to: "static_pages#design", as: :static_pages
  get "php", to: "static_pages#php", as: :php
  post "/design_contact", to: "contacts#create"
  get "/design_success", to: "static_pages#design_success"
  get "/php_success", to: "static_pages#php_success"

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :static_pages, only: :home
  resource :my_pages, only: :show
  resources :texts, only: %i[index show] do
    resource :read_texts, only: %i[create destroy]
  end
  resources :movies, only: [:index] do
    resource :watched_movies, only: %i[create destroy]
  end
  resources :challenges, only: %i[index show] do
    resource :complete_challenges, only: %i[create destroy]
  end
  resource :progresses, only: %i[create destroy]
  resources :questions, only: %i[index show create edit update] do
    resource :solutions, only: [:create]
  end
  resource :memos, only: %i[show update] do
    collection do
      get "preview"
    end
  end
  resources :text_images, only: %i[index create destroy]
end
