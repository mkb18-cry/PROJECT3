Rails.application.routes.draw do
  devise_for :users
  root 'tutorials#index'
  resources :tutorials, only: [:new, :create, :edit, :update, :show, :destory]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
