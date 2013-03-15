Zapp::Application.routes.draw do
  get "projects/new"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :projects
  resources :assigned_projects
  root to: 'static_pages#home'


  match '/about',   to: 'static_pages#about'
  match '/signup',  to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  
end
