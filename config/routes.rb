Rails.application.routes.draw do
  get 'static_pages/home'
  root to: "texts#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

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
