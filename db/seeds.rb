# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ads = Ad.create([
  {category: "Properties", item_location: 'Kedah'},
  {category: "Electronics", item_location: 'Kelantan'},
  {category: "Home & Personal Items", item_location: 'Kuala Lumpur'},
  {category: "Leisure/Sport/Hobbies", item_location: 'Melaka'},
  {category: "Food", item_location: 'Negeri Sembilan'},
  {category: "Vehicles", item_location: 'Pahang'},
  {category: "Vehicles", item_location: 'Penang'},
  {category: "Vehicles", item_location: 'Perak'},
  {category: "Vehicles", item_location: 'Perlis'},
  {category: "Vehicles", item_location: 'Selangor'},
  {category: "Vehicles", item_location: 'Sabah'},
  {category: "Vehicles", item_location: 'Sarawak'},
  {category: "Others", item_location: 'Terengganu'}
  ])

# admin = User.create(username: 'admin', email: 'admin@admin.com', password: 'admin', role: 1)