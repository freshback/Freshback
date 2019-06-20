	Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  get 'about' => 'pages#about'

  resources :posts
end
