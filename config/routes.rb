	Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'keshbacks#index'

  resources :keshbacks
	resources :comments, only: %i[create destroy]
	resources :users,    only: %i[index show]
end
