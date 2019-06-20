	Rails.application.routes.draw do

  devise_for :users
  root 'keshbacks#index'

  resources :keshbacks
	resources :comments, only: %i[create destroy]
end
