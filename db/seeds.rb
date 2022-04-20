User.create!([
  {name: "Test name", email: "test@test.com", password_digest: "$2a$12$0at7rlHcRLBqq.HcCzwTfOND5KLC4D8uuRpnyX.SaRhJWbQw8IKIu", password_confirmation: nil, admin: false},
  {name: "Kaz", email: "em@il.com", password_digest: "$2a$12$wVD5tiqyg76P/wJsyjoCvOqB2I/Kn3ekg2zOsOtE4J9ys2AMKpdB6", password_confirmation: nil, admin: false}
])

Supplier.create!([
  {name: "Tea JPN", email: "jpn-tea@gmail.com", phone_number: "123456789"},
  {name: "Tea China", email: "chi-tea@gmail.com", phone_number: "123456789"},
  {name: "Tea India", email: "ind-tea@gmail.com", phone_number: "123456789"}
])

Category.create!([
  {name: "Unknown"},
  {name: "Japanese"},
  {name: "Chinese"},
  {name: "Indian"}
])


Product.create!([
  {name: "Yi Zhen Bai Hao", price: "31.0", description: "Baihao Yinzhen (simplified Chinese: 白毫银针; traditional Chinese: 白毫銀針; pinyin: báiháo yínzhēn; Wade–Giles: pai2-hao2 yin2-chên1; pronounced [pǎi.xǎu ǐn.ʈʂə́n]), also known as White Hair Silver Needle, is a white tea produced in Fujian Province in China.", quantity: 3, supplier_id: 2, user_id: 1, image_id: nil},
  {name: "Jiaogulan", price: "11.0", description: "Among many common names are five-leaf ginseng, poor man's ginseng, miracle grass, fairy herb, sweet tea vine, gospel herb, and southern ginseng.", quantity: 2 supplier_id: 2, user_id: 1, image_id: nil},
  {name: "Masala Chai", price: "71.0", description: "Masala chai (/tʃaɪ/; lit. 'mixed-spice tea') is a tea beverage made by boiling black tea in milk and water with a mixture of aromatic herbs and spices.", quantity: 6, url: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Masala_Chai.JPG/2560px-Masala_Chai.JPG", supplier_id: 3, user_id: 1, image_id: nil},
  {name: "Kangra", price: "90.0", description: "Kangra tea is a tea from the Kangra district in Himachal Pradesh, India. Both black tea and green tea have been produced in the Kangra Valley since the mid-19th century. Kangra tea was given the Geographical Indication status in 2005.", quantity: 4, url: "https://4.imimg.com/data4/JA/MB/MY-11336946/tulsi-500x500.gif", supplier_id: 3, user_id: 2, image_id: nil},
  {name: "Gaoshan", price: "11.0", description: "High-mountain tea or gaoshan tea (Chinese: 高山茶; pinyin: gāoshān chá; pronounced [káu.ʂán ʈʂʰǎ]) refers to several varieties of Oolong tea grown in the mountains of central Taiwan. It is grown at altitudes higher than 1,000 metres (3,300 ft) above sea level, and includes varieties such as Alishan, Dayuling, Yu Shan, Wushe, and Lishan.", quantity: 2, url: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/%E9%AB%98%E5%B1%B1%E8%8C%B6_1.jpg/2560px-%E9%AB%98%E5%B1%B1%E8%8C%B6_1.jpg", supplier_id: 2, user_id: 1, image_id: nil},
  {name: "Gongmei", price: "24.0", description: "Gong Mei is a white tea made of the Da Bai subvarietal of Camellia sinensis. It is grown mainly in the provinces of Fujian and Guangxi in China. Because this tea is harvested later than Bai Mu Dan it's liquor is slightly darker in color and stronger in taste. The infusion is golden yellow and thus darker than other white teas. Gong Mei is sometimes also referred as Shou Mei although the latter is considered as fourth grade quality while Gong Mei is a third quality grade tea.", quantity: 4, url: "https://teapedia.org/eng/images/thumb/e/ee/Gong-Mei.jpg/1438px-Gong-Mei.jpg", supplier_id: 2, user_id: 2, image_id: nil},
  {name: "Rize", price: "37.0", description: "Three egg whites with spinach, mushrooms, caramelized onions, tomatoes and low-fat feta cheese. With herbed quinoa, and your choice of rye or whole-grain toast.", quantity: 3, url: nil, supplier_id: 3, user_id: 1, image_id: nil},
  
  {name: "Jaekseol", price: "78.0", description: "Jaekseol-cha (잭설차) is a traditional black tea produced in Hadong County, South Gyeongsang Province in South Korea.", quantity: 3, url: nil, supplier_id: 2, user_id: 1, image_id: nil},
  {name: "Yi Zhen Bai Hao", price: "52.0", description: "Breaded fried chicken with waffles, and a side of maple syrup.", quantity: 4, url: nil, supplier_id: 2, user_id: 1, image_id: nil}
])

Image.create!([
  {url: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/types-of-healthy-teas-1640964691.jpg", product_id: 12},
  {url: "https://www.heychina.com.au/wp-content/uploads/2020/04/chinese-teas-chinese-drink.jpg", product_id: 11},
  {url: "https://www.chinalocaltours.com/wp-content/uploads/Top-8-Most-Popular-Chinese-Teas.jpg", product_id: 8}
])

CartedProduct.create!([
  {product_id: 12, user_id: 1, quantity: 2, status: "carted", order_id: 2},
  {product_id: 12, user_id: 2, quantity: 2, status: "purchased", order_id: 7},
  {product_id: 12, user_id: 2, quantity: 2, status: "purchased", order_id: 7}
])

CategoryProduct.create!([
  {product_id: 2, category_id: 2},
  {product_id: 2, category_id: 1},
  {product_id: 12, category_id: 2},
  {product_id: 12, category_id: 1},
  {product_id: 3, category_id: 3}
])
Order.create!([
  {user_id: 1, subtotal: "94.76000000000001", tax: "4.26", total: "99.02"},
  {user_id: 1, subtotal: "94.0", tax: "4.26", total: "99.02"},
  {user_id: 2, subtotal: "180.0", tax: "162.0", total: "342.0"},
  {user_id: 2, subtotal: "180.0", tax: "16.2", total: "196.2"},
  {user_id: 1, subtotal: "0.0", tax: "0.0", total: "0.0"},
  {user_id: 2, subtotal: "0.0", tax: "0.0", total: "0.0"},
  {user_id: 2, subtotal: "379.04", tax: "34.1136", total: "413.1536"}
])

