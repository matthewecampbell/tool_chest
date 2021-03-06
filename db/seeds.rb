# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

Tool.destroy_all

6.times do
  Tool.create(name: Faker::Commerce.product_name, quantity: Faker::Number.number(4), price: Faker::Commerce.price)
end
