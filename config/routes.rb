Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => redirect('/index.html')

  namespace 'api' do
    namespace 'v1' do
      resources :cagematches, only: [:index, :show]
      resources :teams, only: [:index, :show]
    end
  end
end
