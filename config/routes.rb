Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"
  
  get "/suppliers" => "suppliers#index"
  get "/suppliers/:id" => "suppliers#show"
  post "/suppliers" => "suppliers#create"
  patch "/suppliers/:id" => "suppliers#update"
  delete "/suppliers/:id" => "suppliers#destroy"
  
  get "/images" => "images#index"
  get "/images/:id" => "images#show"
  post "/images" => "images#create"
  patch "/images/:id" => "images#update"
  delete "/images/:id" => "images#destroy"

  get "/carted_products" => "carted_products#index"
  get "/carted_products/:id" => "carted_products#show"
  post "/carted_products" => "carted_products#create"
  patch "/carted_products/:id" => "carted_products#update"
  delete "/carted_products/:id" => "carted_products#destroy"

  get "/orders" => "orders#index"
  get "/orders/:id" => "orders#show"
  post "/orders" => "orders#create"
  patch "/orders/:id" => "orders#update"
  delete "/orders/:id" => "orders#destroy"


  post "users" => "users#create"

  post "/sessions" => "sessions#create"

end
