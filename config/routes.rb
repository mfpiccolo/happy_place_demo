Rails.application.routes.draw do
  resources :orders
  resources :purchase_orders
  resources :requests
  resources :line_items

  resource :dashboard

  root to: "orders#index"
end
