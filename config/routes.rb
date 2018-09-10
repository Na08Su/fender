Rails.application.routes.draw do
  get '/related_tags' => "articles#related_tags"
  root 'articles#index'
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :articles, only: [:show]

  get '/search' => "articles#search_page"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
