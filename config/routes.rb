Rails.application.routes.draw do
  get 'daily_tasks/create'
  root 'pages#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'users/:id/doing' => 'users#doing'
	resources :tasks

end
