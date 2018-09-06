Rails.application.routes.draw do
  root 'articles#index'
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :articles, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
