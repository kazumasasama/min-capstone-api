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


  rails g model Supplier name:string email:string phone_number:string

  supplier = Supplier.new(name: "Tea JPN", email: "jpn-tea@gmail.com", phone_number: 123456789)
  supplier = Supplier.new(name: "Tea China", email: "chi-tea@gmail.com", phone_number: 123456789)
  supplier = Supplier.new(name: "Tea India", email: "ind-tea@gmail.com", phone_number: 123456789)

  rails g migration AddSupplierIdToProducts

  rails g model Image url:text product_id:integer

  image = Image.new(url: "https://www.heychina.com.au/wp-content/uploads/2020/04/chinese-teas-chinese-drink.jpg", product_id: 11)

  image = Image.new(url: "https://www.chinalocaltours.com/wp-content/uploads/Top-8-Most-Popular-Chinese-Teas.jpg", product_id: 8)

  rails g model User name:string password_digest:string password_confirmation:string

  rails g controller orders

  rails g model Order user_id:integer product_id:integer quantity:integer subtotal:decimal tax:decimal total:decimal