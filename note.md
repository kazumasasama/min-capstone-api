<!-- Create an app with two routes:
  one shows one particular product
  one shows all the products 

rails new
rails db:create
git add .
git commit ...
(make remote repository on git hub)
(git push origin main)

model
  rails g model
  rails db:migrate

controller
  rails g controller
  create two methods: show, index

route
  config/route.rb
  create two route: show, index　

put info
  seed.rb
    product = Product.new()

  rails db:seed

test request
  access to api with url created -->


<!-- commands -->
controller => 複数形
  rails g controller products

Model => 単数形
  rails g model Product name:string price:integer image_url:string description:text