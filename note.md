<!-- Create an app with two routes:
  one shows one particular product
  one shows all the products 

rails new
rails db:create
git add .
git commit ...
(make remote repository on git hub)
(git push origin main)

route
  config/route.rb
  create two route: show, index

controller
  rails g controller
  create two methods: show, index
model
  rails g model
  rails db:migrate

put info
  seed.rb
    product = Product.new()

  rails db:seed

test request
  access to api with url created -->


rails g controller products

rails g model Product name:string price:integer image_url:string description:text