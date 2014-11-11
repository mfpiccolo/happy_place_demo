Rails.application.routes.draw do
  resources :orders
  resources :purchase_orders
  get "purchase_orders_rails_index" => "purchase_orders#rails_index"

  resources :requests
  resources :line_items

  resource :dashboard

  root to: "dashboards#show"
end
