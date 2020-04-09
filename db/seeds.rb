# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
a = User.find_or_initialize_by(name: 'admin',email: 'admin@gmail.com', is_admin: true)
a.password = 'admin123456'
a.save

product_category1 = ProductCategory.create(title: "Role Playing Game", sorting: 1)
300.times do
  product_category1.products.find_or_create_by(name: Faker::Game.title, platform: Faker::Game.platform, number: 1000, description: Faker::Game.genre+Faker::Game.platform, on_shelf: true, location: Faker::Address.city, price: rand(500), img: Faker::Avatar.image)
end

product_category2 = ProductCategory.create(title: "Action RPG", sorting: 2)
500.times do
  product_category2.products.find_or_create_by(name: Faker::Game.title, platform: Faker::Game.platform, number: 1000, description: Faker::Game.genre+Faker::Game.platform, on_shelf: true, location: Faker::Address.city, price: rand(500), img: Faker::Avatar.image)
end

product_category3 = ProductCategory.create(title: "First Person Shooting", sorting: 3)
800.times do
  product_category3.products.find_or_create_by(name: Faker::Game.title, platform: Faker::Game.platform, number: 1000, description: Faker::Game.genre+Faker::Game.platform, on_shelf: true, location: Faker::Address.city, price: rand(500), img: Faker::Avatar.image)
end

product_category4 = ProductCategory.create(title: "Real Time Strategy", sorting: 4)
200.times do
  product_category4.products.find_or_create_by(name: Faker::Game.title, platform: Faker::Game.platform, number: 1000, description: Faker::Game.genre+Faker::Game.platform, on_shelf: true, location: Faker::Address.city, price: rand(500), img: Faker::Avatar.image)
end

product_category5 = ProductCategory.create(title: "Advanture Game", sorting: 5)
1200.times do
  product_category5.products.find_or_create_by(name: Faker::Game.title, platform: Faker::Game.platform, number: 1000, description: Faker::Game.genre+Faker::Game.platform, on_shelf: true, location: Faker::Address.city, price: rand(500), img: Faker::Avatar.image)
end






