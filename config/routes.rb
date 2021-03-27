# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: :all

  root to: 'static_pages#home'
  devise_scope :user do
    get "login", to: "devise/sessions#new"
    post "login", to: "devise/sessions#create"
    delete "logout", to: "devise/sessions#destroy"

    get "signup", to: "devise/registrations#new"
    post "signup", to: "devise/registrations#create"

    get "confirmation", to: "confirmations#show"
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
