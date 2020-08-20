Rails.application.routes.draw do
  get 'user_projects/create'
  get 'user_projects/destroy'
  root 'pages#index'
  
  resources :projects, only: [:show, :update, :edit, :destroy]
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users do
  end
  resources :users do 
    member do
      resources :projects, only: [:index, :new, :create] do
        member do 
          get :joinings
        end
      end
    end
  end
  resources :user_projects, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
