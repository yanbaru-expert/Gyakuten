Rails.application.routes.draw do
  root to: "movies#index"

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
  }

  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  as :user do
    get "users/edit" => "devise/registrations#edit", :as => "edit_user_registration"
    put "users" => "devise/registrations#update", :as => "user_registration"
  end

  resources :movies, only: [:index]
  resources :users_webs
  resources :words
  resources :contents
  resources :texts
  resources :lines
  resources :moneys
  resources :salons, only: :index
  resources :designs
  resources :questions, only: [:index, :show, :create, :edit, :update]
  resources :questions do
    resource :solutions, only: [:create]
  end
end
