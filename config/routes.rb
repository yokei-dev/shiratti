Rails.application.routes.draw do
  get 'daily_tasks/create'
  root 'pages#index'
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users do
  end
  resources :users do 
    member do
      get :joinings
      resources :tasks, only: [:new, :create]
      resources :projects, only: [:index, :new, :create] 
    end
  end
  resources :tasks, only: [:show, :update, :edit, :destroy]
  resources :projects, only: [:show, :update, :edit, :destroy] do
    member do
      get :users
    end    
  end
  resources :user_projects, only: [:create, :destroy]
  resources :daily_tasks, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'users/:id/todo' => 'users#todo'
  get 'users/:id/doing' => 'users#doing'
  get 'users/:id/done' => 'users#done'

end
