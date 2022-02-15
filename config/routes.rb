Rails.application.routes.draw do
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
  devise_for :users

  get 'welcome/index'
  root to: "welcome#index"

  
  resources :stadiums

end
