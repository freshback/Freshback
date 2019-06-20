	Rails.application.routes.draw do

  devise_for :users
  root 'keshbacks#index'

  resources :keshbacks
end
