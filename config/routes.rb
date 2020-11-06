Rails.application.routes.draw do
  devise_for :users
  root to: "blogs#index" 
  resources :blogs do
    resources :messages, only: :create
  end

  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :purchases, only: [:index, :create]
  end
end
