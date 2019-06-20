	Rails.application.routes.draw do
  get 'keshbacks/index'

  get 'keshbacks/show'

  get 'keshbacks/new'

  get 'keshbacks/edit'

  devise_for :users
  root 'posts#index'

  get 'about' => 'pages#about'

  resources :posts
end
