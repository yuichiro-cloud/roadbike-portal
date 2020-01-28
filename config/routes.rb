Rails.application.routes.draw do
  devise_for :users
  root "gets#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :bikes, only: [:new,:index, :show, :create] do
    get :search, on: :collection
    resources :comments
  end
  resources :users
  resources :groups,only:[:new, :index, :create, :show] do
    resources :chats,only:[:index, :create]

    namespace :api do
      resources :chats, only: :index, defaults: { format: 'json' }
    end
  end
  resources :gets,only:[:index, :show] 
end
