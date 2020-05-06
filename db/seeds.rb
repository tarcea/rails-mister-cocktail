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

Cocktail.destroy_all if Rails.env.development?
Dose.destroy_all if Rails.env.development?

require 'json'
require 'open-uri'
require 'nokogiri'

puts 'stard seeding ingredients'
Ingredient.destroy_all if Rails.env.development?
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
puts 'ingrdients seeds DONE'

puts 'stard seeding cocktails'
# array with names from www.liquor.com
cocktails = ['cosmopolitan', 'traditional-mai-tai', 'a-la-louisiane',
             'pimms-cup', 'spicy-margarita', 'mojito', 'mint-julep',
             'reggae-rum-punch', 'ginger-fever-punch', 'toblerone',
             'la-violetta', 'irish-coffee-2', 'bourbon-strawberry-iced-tea',
             'long-island-iced-tea', 'bourbon-old-fashioned', 'pisco-sour',
             'vodka-soda', 'gin-rickey', 'vodka-gimlet', 'tom-yum-on-a-rock',
             'apple-cranberry-moscow-mule', 'cbd-moscow-mule',
             'summerthyme-screwdriver', 'sparkling-watermelon-punch',
             'cbd-spritz', 'amaretto-sour', 'whiskey-smash', 'manhattan-2',
             'tom-collins-2', 'the-irish-car-bomb', 'classic-bloody-mary',
             'rum-and-smoke', 'painkiller-2', 'suffering-bastard',
             'cbd-gin-and-tonic', 'rosemary-mezcal-negroni', 'bloody-caesar']
cocktails.shuffle.each do |cocktail|
  # start scraping from liquor.com
  url = "https://www.liquor.com/recipes/#{cocktail}/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  image = html_doc.search('.primary-image').attribute('src').nil? ? nil : html_doc.search('.primary-image').attribute('src').value
  title = html_doc.search('.heading__title', 'h1').text.strip
  owner = html_doc.search('.figure__caption-owner').text.strip
  ste = html_doc.search('.mntl-sc-block-group--LI')
  count = 0
  steps_all = []
  ste.each do |step|
    count += 1
    steps_all << "#{count}. #{step.text.strip}"
  end
  file = URI.open(image)
  cocktail = Cocktail.create!(name: title, steps: steps_all)
  cocktail.photo.attach(io: file, filename: owner, content_type: 'image/png/jpg')
  ing = html_doc.search('.ingredient-list')
  ing.search('.simple-list__item').each do |ingredient|
    ingredient_text = ingredient.text.strip
    Dose.create!(cocktail: cocktail, description: ingredient_text, ingredient: Ingredient.new(name: ''))
  end
end
puts 'cocktail seeds DONE'
