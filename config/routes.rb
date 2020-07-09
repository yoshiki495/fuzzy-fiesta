Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'before#home'
  get '/home' => 'before#home'
  get '/home/about' => 'before#about'
  get '/users/mypage' => 'users#mypage'
  resources :books
  resources :users
end
