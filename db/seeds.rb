# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

Cocktail.create(name:"Cuba Libre")
Cocktail.create(name:"Mojito")
Cocktail.create(name:"Margarita")

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_bulk = open(url).read
drinks = JSON.parse(ingredient_bulk)
drinks.each do |key1, drink|
  drink.each do |ingred|
    ingred.each do |key2, value|
      Ingredient.create!(name: value)
    end
  end
end
