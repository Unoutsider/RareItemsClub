Rails.application.routes.draw do
  get 'admin/item_create'
  post 'admin/item_insert', to: 'admin#item_insert'
  get 'admin/orders_show'
  post 'admin/orders_change', to: 'admin#orders_change'
  get 'admin/show_item'
  post 'admin/delete_item', to: 'admin#delete_item'

  get 'order_destroy/destroy'
  root 'main#input', as: 'home'
  get 'main/input'
  get 'main/output'
  post 'main/create', to: 'main#create'
  post 'order_destroy/delete', to: 'order_destroy#delete'
  get 'users/new'
  get 'users/show'
  get 'users/update'
  post 'users/create', to: 'users#create'
  post 'users/destroy', to: 'users#destroy'
  get 'sessions/new'
  post 'sessions/create', to: 'sessions#create'
  post 'sessions/destroy', to: 'sessions#destroy'
  resources :sessions
  resources :users
end
