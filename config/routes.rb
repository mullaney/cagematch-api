# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: redirect('/index.html')

  namespace 'api' do
    namespace 'v1' do
      resources :cagematches, only: %i[index show]
      resources :teams, only: %i[index show]
      resources :posts, only: %i[index show]
    end
  end
end
