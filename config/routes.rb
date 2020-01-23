Rails.application.routes.draw do
  devise_for :users
  root "gets#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :bikes, only: [:new,:index, :show, :create]
  resources :users
  resources :groups,only:[:new]
  resources :gets,only:[:index, :show] do
    get :search, on: :collection
  end

end
